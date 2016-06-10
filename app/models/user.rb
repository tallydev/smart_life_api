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

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_length_of :password, :minimum => 8, :message => "密码至少8位!", :if => :password
  validates_uniqueness_of :phone, :message => "此手机号已经注册!"
  enum is_active: [:activity, :unused]
end
