class PromotionsController < ApplicationController
	# acts_as_token_authentication_handler_for User
	before_action :set_promotion, only: [:show]
	
	respond_to :json

	def index
		page = params[:page] || 1
    per_page = params[:per_page] || 10
    # 复用 product 的 view
		# @products = @promotions = Promotion.subdistrict_is(current_user.subdistrict_id).for_sale.paginate(page: page, per_page: per_page)
		@products = @promotions = Promotion.for_sale.paginate(page: page, per_page: per_page)
		respond_with @products, template: 'products/index'
	end

	def show
		@product = @promotion
		respond_with @product, template: 'products/show'
	end

	private
	def set_promotion
		# @promotion = Promotion.subdistrict_is(current_user.subdistrict_id).find(params[:id]) if params[:id]
		@promotion = Promotion.find(params[:id]) if params[:id]
	end
end