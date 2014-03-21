class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # layout 'slate'
  layout :choose_layout
  def choose_layout
    unless current_user
     'slate'
     else
      if current_user.seller || current_user.admin
       'application'
      end
    end    
  end
  def admin_reseller_required
     
  end
  
  def login_required
    unless current_user
      redirect_to root_path
    end
  end
  def activate_user
    
  end
end
