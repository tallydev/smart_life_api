class RegistrationsController < Devise::RegistrationsController
  # after_filter :check_subdistrict 



  def sign_up(_resource_name, user)
    super
    # do your stuff here
    current_user.check_subdistrict
  end


  protected

  # def check_subdistrict
    # current_user.check_subdistrict
 # end
end