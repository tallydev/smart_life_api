class UserInfosController < ApplicationController

  acts_as_token_authentication_handler_for User, except: [:check, :reset] 

  before_action :set_user_info, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @user_infos = UserInfo.all
    respond_with(@user_infos)
  end

  def show
    respond_with(@user_info)
  end

  def new
    @user_info = UserInfo.new
    respond_with(@user_info)
  end

  def edit
  end

  def create
    @user_info = UserInfo.new(user_info_params)
    @user_info.save
    respond_with(@user_info)
  end

  def update
    @user_info.update(user_info_params)
    respond_with(@user_info, template: "user_infos/show")
  end

  def destroy
    @user_info.destroy
    respond_with(@user_info)
  end

  private
    def set_user_info
      @user_info = current_user.info
    end

    def user_info_params
      params.require(:user_info).permit(
        :nickname, :identity_card, :sex, :birth, :slogan, :pay_password,
        avatar_attributes: [:id, :photo, :_destroy]
        )
    end
end
