class ContactsController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @contacts = current_user.contacts.all
    respond_with(@contacts)
  end

  def show
    respond_with(@contact)
  end

  def new
    @contact = current_user.contacts.build
    respond_with(@contact)
  end

  def edit
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    @contact.save
    respond_with(@contact)
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact, template: "contacts/show")
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  private
    def set_contact
      @contact = current_user.contacts.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(
        :name, :phone, :conmunity, :address, :is_default
        )
    end
end
