class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # layout 'slate'
  layout :choose_layout
  def choose_layout
    if current_user && current_user.seller
    'application'
    else
     'slate'
    end
  end
end
