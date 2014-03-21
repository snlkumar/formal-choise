class HomesController < ApplicationController
  before_filter :activate_user
  def index
    @products=Product.all
  end
end
