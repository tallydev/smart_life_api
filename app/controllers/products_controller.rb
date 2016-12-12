class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :create_thumb, :destroy_thumb]

  respond_to :html, :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    @products = Product.for_sale.paginate(page: page, per_page: per_page)
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def sort
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    @products = Product.for_sale.sort_is(params[:sort]).paginate(page: page, per_page: per_page)
    respond_with(@products)
  end

  # def new
  #   @product = Product.new
  #   respond_with(@product)
  # end

  # def edit
  # end

  # def create
  #   @product = Product.new(product_params)
  #   @product.save
  #   respond_with(@product)
  # end

  # def update
  #   @product.update(product_params)
  #   respond_with(@product)
  # end

  # def destroy
  #   @product.destroy
  #   respond_with(@product)
  # end

  # def create_thumb
  #   @thumb = @product.thumbs.build(params[:thumb])
  #   if @thumb.save
  #     render nothing: true, status: 201
  #   else
  #     render nothing: true, status: 422
  #   end
  # end

  # def destroy_thumb
  #   @thumb = @product.thumbs.find(params[:thumb_id])
  #   @thumb.destroy
  #   render nothing: true, status: 204
  # end

  private
    def set_product
      @product = Product.for_sale.find(params[:id])
    end

    def product_params
      params[:product]
    end
end
