class Activity::SqhdsController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :set_activity_sqhd, only: [:show, :edit, :update, :destroy, :appoint]

  respond_to :html, :json

  def index
    p @activity_sqhds = Activity::Sqhd.subdistrict_is(current_user.subdistrict_id).reverse_order
    respond_with(@activity_sqhds)
  end

  def show
    respond_with(@activity_sqhd)
  end

  def appoint
    type = "Appointment::Sqhd"
    count = appointment_params[:count]
    @appointment = current_user.appointments.subdistrict_is(current_user.subdistrict_id).build(
      type: type, count: count, aptable: @activity_sqhd
      )
    @appointment.save
    respond_with(@appointment, template: "appointments/show")
  end

  private
    def set_activity_sqhd
      @activity_sqhd = Activity::Sqhd.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(
        :count
        )
    end
end
