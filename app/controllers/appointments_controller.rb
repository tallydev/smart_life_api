class AppointmentsController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    @appointments = current_user.appointments.subdistrict_is(current_user.subdistrict_id).paginate(page: page, per_page: per_page)
    respond_with(@appointments)
  end

  def show
    respond_with(@appointment)
  end

  def new
    @appointment = Appointment.new
    respond_with(@appointment)
  end

  def edit
  end
# Appointment.all.each do |appt|
#   if appt.user && appt.user
  def create
    type = "Appointment::#{appointment_params[:type].capitalize}"
    count = appointment_params[:count]
    p current_user.appointments.subdistrict_is(current_user.subdistrict_id)
    @appointment = current_user.appointments.subdistrict_is(current_user.subdistrict_id).build(type: type, count: count)
    @appointment.save
    respond_with(@appointment)
  end

  def update
    @appointment.update(appointment_params)
    respond_with(@appointment)
  end

  def destroy
    @appointment.destroy
    respond_with(@appointment)
  end

  private
    def set_appointment
      @appointment = current_user.appointments.subdistrict_is(current_user.subdistrict_id).find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(
        :type, :count
        )
    end
end
