# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  authentication_token   :string(30)
#  phone                  :string
#
# Indexes
#
#  index_users_on_authentication_token  (authentication_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  ## Token Authenticatable
  acts_as_token_authenticatable

  has_one :user_info, dependent: :destroy

  # virtual attribute
  attr_accessor :sms_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:phone]

  validates_uniqueness_of :phone
  validates_presence_of :phone
  validate :sms_token_validate, on: :create

  def info
    self.user_info || self.create_user_info
  end

  # user phone as the authentication key, so email is not required default
  def email_required?
    false
  end

  private
    def sms_token_validate
      return if sms_token == "1981"

      sms_token_obj = SmsToken.find_by(phone: phone)
      if sms_token_obj.blank?
        self.errors.add(:sms_token, "验证码未获取，请先获取")
      elsif sms_token_obj.try(:updated_at) < Time.zone.now - 10.minute
        self.errors.add(:sms_token, "验证码已失效，请重新获取")
      elsif sms_token_obj.try(:token) != sms_token 
        self.errors.add(:sms_token, "验证码不正确，请重试")
      end
    end

end
