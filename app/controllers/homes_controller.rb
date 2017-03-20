class HomesController < ApplicationController
  acts_as_token_authentication_handler_for User
  
  respond_to :html, :json
  # 其他内容
  def home_info
    @subdistrict = current_user.subdistrict_id
    @banners = Banner.subdistrict_is(@subdistrict.id).all
    @promotion = Promotion.subdistrict_is(@subdistrict.id).for_sale.first
    @home_blocks = @subdistrict.try(:home_blocks)
    respond_with @banners, template: 'homes/home_info', status: 200
  end

  def index
  end
  # 步数 定时访问
  def show
    @today = Time.zone.today
    @sport = current_user.his_sports.filter_date(@today).try(:first)
    @rank = @sport.try(:rank) || "--"
    @step = @sport.try(:count) || 0
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
