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
#
# Indexes
#
#  index_appointments_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Appointment::Zhjk, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
