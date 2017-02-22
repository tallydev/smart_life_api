class CustomSessionsController < Devise::SessionsController
  before_filter :before_login, :only => :create
  after_filter :after_login, :only => :create

  def before_login
  	
  end

  def after_login
  	current_user.check_subdistrict
  end
end