class SportsController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :set_sport, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @sports = Sport.all
    respond_with(@sports)
  end

  def show
    respond_with(@sport)
  end

  def new
    @sport = Sport.new
    respond_with(@sport)
  end

  def edit
  end

  def create
    date = Time.zone.today
    @sport = current_user.sports.where(date: date).first_or_create
    @sport.count = sport_params[:count]
    @sport.save
    respond_with(@sport)
  end

  def update
    @sport.update(sport_params)
    respond_with(@sport)
  end

  def destroy
    @sport.destroy
    respond_with(@sport)
  end

  private
    def set_sport
      @sport = Sport.find(params[:id])
    end

    def sport_params
      params.require(:sport).permit(
        :count
        )
    end
end
