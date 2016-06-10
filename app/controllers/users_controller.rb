class UsersController < ApplicationController
  # skip_before_filter :require_login #, :except => [:destroy]

  def create
    @user = User.new(user_params)
    @user.save
  end

  def sign_in
    @user = login(user_params[:phone], user_params[:password], nil)
  end

  private
  def user_params
    params.require(:user).permit(:phone, :password, :name, :password_confirmation)
  end
end
