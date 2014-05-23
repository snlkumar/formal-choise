class BuyersController < ApplicationController  
  def new
    @buyer=Buyer.new
     @buyer.build_user
     render layout: "user"
  end
  
  def create
    @buyer=Buyer.new(buyer_params)
    if @buyer.save
    redirect_to homes_path
    else
      render 'new'
    end
  end
  
   private

  def buyer_params
    params.require(:buyer).permit(:first_name,:last_name,:address,:mobile, user_attributes: [:email,:password,:password_confirmation])
  end
end
