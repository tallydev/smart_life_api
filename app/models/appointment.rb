# == Schema Information
#
# Table name: appointments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  idname     :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  count      :integer
#  state      :integer
#
# Indexes
#
#  index_appointments_on_user_id  (user_id)
#

class Appointment < ActiveRecord::Base

  include AASM

  belongs_to :user

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
