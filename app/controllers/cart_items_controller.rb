class CartItemsController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :check_stocks, only: [:index, :show]
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    @cart_items = current_user.cart_items.subdistrict_is(current_user.subdistrict_id).editing.paginate(page: page, per_page: per_page)
    respond_with(@cart_items)
  end

  def show
    respond_with(@cart_item)
  end

  # def new
  #   @cart_item = CartItem.new
  #   respond_with(@cart_item)
  # end

  # def edit
  # end

  def create
    @cart_item = current_user.cart_items.subdistrict_is(current_user.subdistrict_id).editing.product_id_is(params[:cart_item][:product_id]).try(:first)
    if @cart_item
      @cart_item.count += params[:cart_item][:count].to_i
    else
      @cart_item = current_user.cart_items.subdistrict_is(current_user.subdistrict_id).build(cart_item_params)
    end
    @cart_item.save
    respond_with(@cart_item)
  end

  def update
    @cart_item.update(cart_item_params)
    respond_with(@cart_item, template: "cart_items/show")
  end

  def destroy
    @cart_item.canceled!
    respond_with(@cart_item)
  end

  # def pay
  #   @cart_items = current_user.cart_items.where(id: cart_item_pay_params[:cart_item_ids])
  #   @cart_items.each do |cart_item|
  #     cart_item.pay!
  #   end
  #   respond_with(@cart_items, template: "cart_items/index", status: 201)
  # end

  private
    def set_cart_item
      @cart_item = current_user.cart_items.subdistrict_is(current_user.subdistrict_id).editing.find(params[:id])
    end

    def cart_item_params
      params.require(:cart_item).permit(
        :count, :product_id
        )
    end

    def cart_item_pay_params
      params.require(:cart_item).permit(
        cart_item_ids: []
        )
    end

    def check_stocks
      CartItem.check_stocks(current_user.cart_items.subdistrict_is(current_user.subdistrict_id))
    end
end
