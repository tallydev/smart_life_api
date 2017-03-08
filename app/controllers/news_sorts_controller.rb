class NewsSortsController < ApplicationController
  before_action :set_news_sort, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @news_sorts = NewsSort.all
    respond_with(@news_sorts)
  end

  def show
    respond_with(@news_sort)
  end

  def new
    @news_sort = NewsSort.new
    respond_with(@news_sort)
  end

  def edit
  end

  def create
    @news_sort = NewsSort.new(news_sort_params)
    @news_sort.save
    respond_with(@news_sort)
  end

  def update
    @news_sort.update(news_sort_params)
    respond_with(@news_sort)
  end

  def destroy
    @news_sort.destroy
    respond_with(@news_sort)
  end

  private
    def set_news_sort
      @news_sort = NewsSort.find(params[:id])
    end

    def news_sort_params
      params[:news_sort]
    end
end
