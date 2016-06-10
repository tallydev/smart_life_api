class BannersController < ApplicationController
  before_action :set_banner, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @banners = Banner.all
    respond_with(@banners)
  end

  def show
    respond_with(@banner)
  end

  def new
    @banner = Banner.new
    respond_with(@banner)
  end

  def edit
  end

  def create
    @banner = Banner.new(banner_params)
    @banner.save
    respond_with(@banner)
  end

  def update
    @banner.update(banner_params)
    respond_with(@banner)
  end

  def destroy
    @banner.destroy
    respond_with(@banner)
  end

  private
    def set_banner
      @banner = Banner.find(params[:id])
    end

    def banner_params
      params[:banner]
    end
end
