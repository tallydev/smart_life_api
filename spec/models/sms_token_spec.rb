# == Schema Information
#
# Table name: sms_tokens
#
#  id         :integer          not null, primary key
#  phone      :string(191)
#  token      :string(191)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sms_tokens_on_phone  (phone)
#

require 'rails_helper'

RSpec.describe SmsToken, type: :model do
  
end
