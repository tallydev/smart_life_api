class CustomerServicesController < ApplicationController
  acts_as_token_authentication_handler_for User 
  before_action :set_customer_service, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @customer_services = CustomerService.subdistrict_is(current_user.subdistrict_id)
    respond_with(@customer_services)
  end

  def show
    respond_with(@customer_service)
  end

  # def new
  #   @customer_service = CustomerService.new
  #   respond_with(@customer_service)
  # end

  # def edit
  # end

  # def create
  #   @customer_service = CustomerService.new(customer_service_params)
  #   @customer_service.save
  #   respond_with(@customer_service)
  # end

  # def update
  #   @customer_service.update(customer_service_params)
  #   respond_with(@customer_service)
  # end

  # def destroy
  #   @customer_service.destroy
  #   respond_with(@customer_service)
  # end

  private
    def set_customer_service
      @customer_service = CustomerService.find(params[:id])
    end

    def customer_service_params
      params[:customer_service]
    end
end
