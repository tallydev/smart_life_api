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
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  ## Token Authenticatable
  acts_as_token_authenticatable

  has_one :user_info, dependent: :destroy
  has_many :sports, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :contacts, dependent: :destroy

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

  delegate :nickname, :sex, :birth, :name, to: :user_info, allow_nil: true

  def info
    self.user_info || self.create_user_info
  end

  def self.setup phone
    password = (0..9).to_a.sample(4).join
    user = User.create(phone: phone, password: password, sms_token: "1981")
    SmsToken.password_notify phone, password
    user
  end

  # user phone as the authentication key, so email is not required default
  def email_required?
    false
  end

  def set_sport_count count
    Sport::Weekly.where(user: self).last.update(count: count)
    Sport::Monthly.where(user: self).last.update(count: count)
    Sport::Yearly.where(user: self).last.update(count: count)
  end

  def self.reset_user_password params
    phone = params[:phone]
    password = params[:password]
    sms_token = params[:sms_token]
    user = User.find_by phone: phone

    if user.present?
      if SmsToken.valid? phone, sms_token
        user.password = password
        user.sms_token = sms_token
        user.save
      else
        user.errors.add(:sms_token, "验证码不正确，请重试")
      end
    else
      user = User.new
      user.errors.add(:phone, "手机号码对应的用户不存在")
    end
    user
  end

  private
    def sms_token_validate
      return if sms_token == "1981"

      sms_token_obj = SmsToken.find_by(phone: phone)
      if sms_token_obj.blank?
        self.errors.add(:sms_token, "验证码未获取，请先获取")
      elsif sms_token_obj.try(:updated_at) < Time.zone.now - 15.minute
        self.errors.add(:sms_token, "验证码已失效，请重新获取")
      elsif sms_token_obj.try(:token) != sms_token 
        self.errors.add(:sms_token, "验证码不正确，请重试")
      end
    end

end
