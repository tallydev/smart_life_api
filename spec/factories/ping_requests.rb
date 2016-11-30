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
#  order_id    :integer
#

FactoryGirl.define do
  factory :ping_request do
    
  end
end
