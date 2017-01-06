# == Schema Information
#
# Table name: ping_requests
#
#  id          :integer          not null, primary key
#  object_type :string(191)
#  ping_id     :string(191)
#  complete    :boolean
#  amount      :integer
#  subject     :string(191)
#  body        :string(191)
#  client_ip   :string(191)
#  extra       :string(191)
#  order_no    :string(191)
#  channel     :string(191)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  order_id    :integer
#  metadata    :string(191)
#
# Indexes
#
#  fk_rails_975af3fa0e  (order_id)
#

FactoryGirl.define do
  factory :ping_request do
    
  end
end
