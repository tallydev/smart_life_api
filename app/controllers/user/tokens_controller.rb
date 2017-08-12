class User::TokensController < ApplicationController
  def create
    token = User.exchange_token user_params[:phone]
    render json: { token: token }
  end

  private

  def user_params
    params.required(:user).permit(
      :phone
    )
  end
end
