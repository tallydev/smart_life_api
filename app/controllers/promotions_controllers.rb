class PromotionsController < ApplicationController

	acts_as_token_authentication_handler_for User, only: :create_order_directly
	before_action :set_promotion, only: [:show, :create_order_directly]
	
	def index
		
	end

	def show
		
	end

	def create_order_directly
		
	end



	private
	def set_promotion
		@promotion = Promotions.find(params[:id]) if params[:id]
	end
end