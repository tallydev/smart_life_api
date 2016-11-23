# == Schema Information
#
# Table name: appointments
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  idname       :string
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  count        :integer
#  state        :integer
#  aptable_id   :integer
#  aptable_type :string
#
# Indexes
#
#  index_appointments_on_aptable_type_and_aptable_id  (aptable_type,aptable_id)
#  index_appointments_on_user_id                      (user_id)
#

# 智慧健康预约
class Appointment::Zhjk < Appointment
  def self.model_name
    Appointment.model_name
  end

  def human_type
    "智慧健康预约"
  end
end
