class OrdersController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :check_stocks, only: [:index, :show]
  before_action :set_order, only: [:show, :edit, :update, :destroy, :recover_stocks, :create_payment]

  respond_to :html, :json

  def index
    @orders = current_user.orders.all
    respond_with(@orders)
  end

  def show
    @order.set_disable_if_necessary
    respond_with(@order)
  end

  # def new
  #   @order = Order.new
  #   respond_with(@order)
  # end

  # def edit
  # end

  def create #params [id数组]
    @order = Order.create_one(order_params, params[:cart_item_ids])
    if @order.is_a?(Order)
      respond_with @order, template: 'orders/show', status: 201
    else
      render json: { error: @order.to_s }, status: 422
    end
  end

  def update
    @order.update(order_params)
    respond_with @order, template: "orders/show", status: 201
  end

  def destroy
    @order.canceled!
    @order.cart_items.each {|cart_item| cart_item.canceled!}
    respond_with @order, template: "orders/show", status: 204
  end

  def create_payment #params[:pay_way]
    @order.cut_stocks
    if @order.is_a?(Order)
      p @order.its_cart_items.map{|x|x.product.count}
      render nothing: true, status: 201
      #请求ping++ 支付
      # @charge = PingRequest.get_pay_order(self, params[:pay_way])
      # if @change.is_a?(Pingpp::Charge)
      #   render json: @change, status: 200
      # else
      #   render json: @change, status: 422
    else
      render json: { error: @order.to_s }, status: 422
    end
  end

  def recover_stocks
    @order.recover_stocks
    # p @order.its_cart_items.map{|x|x.product.count}
    render nothing: true, status: 201
  end

  private
    def set_order
      @order = current_user.orders.find(params[:id])
    end

    def order_params
      params.require(:order).permit(
        :user_id
        )
    end

    def check_stocks
      CartItem.check_stocks(current_user.cart_items)
    end
end
