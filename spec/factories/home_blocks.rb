# == Schema Information
#
# Table name: home_blocks
#
#  id            :integer          not null, primary key
#  admin_user_id :integer
#  title         :string(191)
#  ranking       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_home_blocks_on_admin_user_id  (admin_user_id)
#

FactoryGirl.define do
  factory :home_block do
    admin_users nil
    title "MyString"
    ranking 1
  end
end
