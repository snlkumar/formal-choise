class BuyersController < ApplicationController  
  def new
    @buyer=Buyer.new
     @buyer.build_user
     render layout: "user"
  end
end
