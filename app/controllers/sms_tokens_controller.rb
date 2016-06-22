class SmsTokensController < ApplicationController

  respond_to :html, :json

  def register
    @sms_token = SmsToken.register sms_token_params[:phone]
    respond_with(@sms_token)
  end

  private

    def sms_token_params
      params.require(:sms_token).permit(:phone)
    end
end
