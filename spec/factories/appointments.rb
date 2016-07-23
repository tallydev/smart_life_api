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
#
# Indexes
#
#  index_appointments_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :appointment do
    count 3
    type "Appointment::Zhjk"
  end
end
