class ProductSortsController < ApplicationController
  before_action :set_product_sort, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @product_sorts = ProductSort.all
    respond_with(@product_sorts)
  end

  def show
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
      @product_sort = ProductSort.find(params[:id])
    end

    def product_sort_params
      params[:product_sort]
    end
end
