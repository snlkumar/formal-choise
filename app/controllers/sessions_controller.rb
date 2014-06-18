class SessionsController < Devise::SessionsController
  # skip_before_filter :require_no_authentication
  before_filter :activate_user
  def new   
  super 
  end
  def create
    puts "i am in create with#{params}"
   self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    if !session[:return_to].blank?
      redirect_to session[:return_to]
      session[:return_to] = nil
    else
      respond_with resource, :location => after_sign_in_path_for(resource)
    end
  end
  # def after_sign_in_path_for(resource)
    # if current_cart
    #end
  # end
end
