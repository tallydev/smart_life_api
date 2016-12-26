class HomesController < ApplicationController
  acts_as_token_authentication_handler_for User
  
  respond_to :html, :json

  def index
  end

  def show
    @today = Time.zone.today
    @sport = current_user.sports.filter_date(@today).try(:first)
    @rank = @sport.try(:rank) || "--"
    @step = @sport.try(:count) || 0
    @banners = Banner.all
  end

  def new
    @home = Home.new
    respond_with(@home)
  end

  def edit
  end

  def create
    @home = Home.new(home_params)
    @home.save
    respond_with(@home)
  end

  def update
    @home.update(home_params)
    respond_with(@home)
  end

  def destroy
    @home.destroy
    respond_with(@home)
  end

  private

    def home_params
      params.require(:home).permit(:index)
    end
end
