# == Schema Information
#
# Table name: appointments
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  idname         :string(191)
#  type           :string(191)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  count          :integer
#  state          :integer
#  aptable_id     :integer
#  aptable_type   :string(191)
#  subdistrict_id :integer          default(1)
#
# Indexes
#
#  fk_rails_8e5577c7fd                                (subdistrict_id)
#  index_appointments_on_aptable_type_and_aptable_id  (aptable_type,aptable_id)
#  index_appointments_on_user_id                      (user_id)
#

class Appointment < ActiveRecord::Base

  include AASM

  belongs_to :user
  belongs_to :aptable, polymorphic: true
  belongs_to :subdistrict
  scope :subdistrict_is, ->(subdistrict_id){where(subdistrict_id: subdistrict_id)}

  after_create :generate_idname

  attr_reader :appointment_type, :date

  enum state: {
    commited: 0,
    confirmed: 1
  }

  aasm column: :state, enum: true do
    state :commited, initial: true
    state :confirmed

    event :confirm do
      transitions from: :commited, to: :confirmed
    end
  end

  def state_alias
    I18n.t :"appointment_state.#{state}"
  end

  def date
    self.created_at.to_date
  end

  def appointment_type
    self.type.try(:split, "::").try(:last).try(:upcase)
  end

  private
    def generate_idname
      type_str = self.appointment_type
      self.update_attribute(:idname, "#{type_str}#{self.id.to_s.rjust(8, '0')}")
    end
end
