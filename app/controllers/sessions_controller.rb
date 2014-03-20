class SessionsController < Devise::SessionsController
  # skip_before_filter :require_no_authentication
  def new
    puts "i am in seassion new#{current_user}"
  super
  end
  def create
    super
   puts current_user.id
  end
  def after_sign_in_path_for(resource)
   puts "i am here#{resource.admin}"
  end
end
