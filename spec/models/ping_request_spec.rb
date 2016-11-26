# == Schema Information
#
# Table name: ping_requests
#
#  id          :integer          not null, primary key
#  object_type :string
#  ping_id     :string
#  complete    :boolean
#  amount      :integer
#  subject     :string
#  body        :string
#  client_ip   :string
#  extra       :string
#  order_no    :string
#  channel     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe PingRequest, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
