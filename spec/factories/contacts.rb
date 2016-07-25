# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  phone      :string
#  conmunity  :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order      :integer
#
# Indexes
#
#  index_contacts_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :contact do
    name "contact name"
    phone "contact phone"
    conmunity "contact conmunity"
    address "contact address"
    is_default true
  end
end
