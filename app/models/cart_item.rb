# == Schema Information
#
# Table name: cart_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  count      :integer
#  amount     :float
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_cart_items_on_product_id  (product_id)
#  index_cart_items_on_user_id     (user_id)
#

class CartItem < ActiveRecord::Base

  include AASM

  belongs_to :product
  belongs_to :user

  enum state: {
    unpaid: 1,
    paid: 2,
    canceled: 9
  }

  aasm do
    state :unpaid, initial: true
    state :paid, :canceled

    event :pay do
      transitions from: :unpaid, to: :paid
    end

    event :cancel do
      transitions from: :unpaid, to: :canceled
    end
  end
end
