# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  phone            :string(255)      not null
#  crypted_password :string(255)
#  salt             :string(255)
#  is_active        :integer          default("0")
#  created_at       :datetime
#  updated_at       :datetime
#
# Indexes
#
#  index_users_on_phone  (phone) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
