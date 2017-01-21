class ProductSortsController < ApplicationController
  before_action :set_product_sort, only: [:show, :edit, :update, :destroy]
  acts_as_token_authentication_handler_for User
  
  respond_to :html

  def index
    @product_sorts = ProductSort.subdistrict_is(current_user.subdistrict_id)
    respond_with(@product_sorts)
  end

  def show
    @products = @product_sort.products
    respond_with(@product_sort)
  end

  # def new
  #   @product_sort = ProductSort.new
  #   respond_with(@product_sort)
  # end

  # def edit
  # end

  # def create
  #   @product_sort = ProductSort.new(product_sort_params)
  #   @product_sort.save
  #   respond_with(@product_sort)
  # end

  # def update
  #   @product_sort.update(product_sort_params)
  #   respond_with(@product_sort)
  # end

  # def destroy
  #   @product_sort.destroy
  #   respond_with(@product_sort)
  # end

  private
    def set_product_sort
      @product_sort = ProductSort.subdistrict_is(current_user.subdistrict_id).find(params[:id])
    end

    def product_sort_params
      params[:product_sort]
    end
end
