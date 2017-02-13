class BannersController < ApplicationController
  # acts_as_token_authentication_handler_for User
  before_action :set_banner, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    # 没有鉴权的旧版默认显示社区Id为1内容
    @banners = Banner.subdistrict_with_token(request.headers.env["HTTP_X_USER_TOKEN"])
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

  # def create
  #   @banner = Banner.subdistrict_with_token(request.headers.env["HTTP_X_USER_TOKEN"]).builde(banner_params)
  #   @banner.save
  #   respond_with(@banner)
  # end

  # def update
  #   @banner.update(banner_params)
  #   respond_with(@banner)
  # end

  # def destroy
  #   @banner.destroy
  #   respond_with(@banner)
  # end

  private
    def set_banner
      @banner = Banner.find(params[:id])
    end

    def banner_params
      params[:banner]
    end
end
