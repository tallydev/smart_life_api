class Activity::SqhdsController < ApplicationController
  before_action :set_activity_sqhd, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @activity_sqhds = Activity::Sqhd.all
    respond_with(@activity_sqhds)
  end

  def show
    respond_with(@activity_sqhd)
  end

  def new
    @activity_sqhd = Activity::Sqhd.new
    respond_with(@activity_sqhd)
  end

  def edit
  end

  def create
    @activity_sqhd = Activity::Sqhd.new(activity_sqhd_params)
    @activity_sqhd.save
    respond_with(@activity_sqhd)
  end

  def update
    @activity_sqhd.update(activity_sqhd_params)
    respond_with(@activity_sqhd)
  end

  def destroy
    @activity_sqhd.destroy
    respond_with(@activity_sqhd)
  end

  private
    def set_activity_sqhd
      @activity_sqhd = Activity::Sqhd.find(params[:id])
    end

    def activity_sqhd_params
      params[:activity_sqhd]
    end
end
