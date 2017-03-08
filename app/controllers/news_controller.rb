class NewsController < ApplicationController
  acts_as_token_authentication_handler_for User
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  respond_to :json

  def index
    @news_sort = NewsSort.find_by_id(params[:news_sort_id])
    raise 'news_sort_id 错误' unless @news_sort
    @news = @news_sort.news
    respond_with(@news)
  end

  def show
    respond_with(@news)
  end

  def new
    @news = News.new
    respond_with(@news)
  end

  def edit
  end

  def create
    @news = News.new(news_params)
    @news.save
    respond_with(@news)
  end

  def update
    @news.update(news_params)
    respond_with(@news)
  end

  def destroy
    @news.destroy
    respond_with(@news)
  end

  private
    def set_news
      @news = News.find(params[:id])
    end

    def news_params
      params[:news]
    end
end
