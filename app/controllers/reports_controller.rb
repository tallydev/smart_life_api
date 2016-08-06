class ReportsController < ApplicationController
  acts_as_token_authentication_handler_for User

  respond_to :html, :json

  def index
    @report = current_user.info.exam_report
  end

  def show
    @item_name = params[:item].to_sym
    @item_info = Exam::Report.item_infos[@item_name]
    page = params[:page]
    per_page = params[:per_page]
    @report_items = current_user.info.exam_records.filter(@item_name)
        .date_desc.paginate(page: page, per_page: per_page)
  end

end
