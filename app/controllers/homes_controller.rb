class HomesController < ApplicationController
  before_filter :activate_user
  def index
    @products=Product.all
  end
  def about_us
    render layout: "user"
  end
end
