class SportsController < ApplicationController
  acts_as_token_authentication_handler_for User

  respond_to :html, :json

  def create
    date = sport_params[:date]
    @sport = current_user.sports.where(date: date).first_or_initialize
    @sport.count = sport_params[:count]
    @sport.save
    respond_with(@sport)
  end

  def daily
    @date = Time.zone.today
    @relations = Sport.filter_date(@date)
    @detail_sports = []
    @avg_count = current_user.sports.by_day.average(:count).to_i
    fill
    respond_with(@sport, template: "sports/index")
  end

  def weekly
    @date = Time.zone.today
    @relations = Sport::Weekly.filter_date(@date)
    detail_hash = {}
    current_user.sports.by_week.order(date: :asc).each { |sport| detail_hash[sport.date] = sport.count}
    @detail_sports = {}
    (@date.beginning_of_week..@date.end_of_week).each do |date|
      @detail_sports[date.to_s] = detail_hash[date] || 0
    end
    
    @avg_count = current_user.sports.by_week.average(:count).to_i
    fill
    respond_with(@sport, template: "sports/index")
  end

  def monthly
    @date = Time.zone.today
    @relations = Sport::Monthly.filter_date(@date)
    detail_hash = {}
    current_user.sports.by_month.order(date: :asc).each { |sport| detail_hash[sport.date] = sport.count}
    @detail_sports = {}
    (@date.beginning_of_month..@date.end_of_month).each do |date|
      @detail_sports[date.to_s] = detail_hash[date] || 0
    end
    @avg_count = current_user.sports.by_month.average(:count).to_i
    fill
    respond_with(@sport, template: "sports/index")
  end

  def yearly
    @date = Time.zone.today
    @relations = Sport::Yearly.filter_date(@date)
    detail_hash = {}
    Sport::Monthly.where(user: current_user, year: @date.year).order(created_at: :asc).each do |sport|
      detail_hash[sport.tag] = sport.count
    end
    @detail_sports = {}
    (1..12).each do |month|
      key = "#{@date.year}-#{month}"
      @detail_sports[key] = detail_hash[key] || 0
    end
    @avg_count = current_user.sports.by_year.average(:count).to_i
    fill
    respond_with(@sport, template: "sports/index")
  end


  private

    def fill
      @today_sport = Sport.filter_date(Time.zone.today).find_by(user: current_user)
      @sport = @relations.find_by(user: current_user)
      @rank = @relations.where("count > :count", count: @sport.count).count + 1
      @rank_percent = (1 - (@rank - 1.0) / @relations.count).round(4)  
    end

    def sport_params
      params.require(:sport).permit(
        :count, :date
        )
    end
end
