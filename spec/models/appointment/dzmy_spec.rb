# == Schema Information
#
# Table name: appointments
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  idname         :string
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  count          :integer
#  state          :integer
#  aptable_id     :integer
#  aptable_type   :string
#  subdistrict_id :integer
#
# Indexes
#
#  index_appointments_on_aptable_type_and_aptable_id  (aptable_type,aptable_id)
#  index_appointments_on_user_id                      (user_id)
#

require 'rails_helper'

RSpec.describe Appointment::Dzmy, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
