class SellersController < ApplicationController
   before_filter :activate_user
  def new
    @seller=Seller.new
     @seller.build_user
     render layout: "user"
  end
  
  def index
    @sellers=Seller.all.order('updated_at DESC') 
  end
  def create
    @seller=Seller.new(person_params)
    if @seller.save
    redirect_to seller_products_path(@seller)
    else
      render 'new'
    end
  end
  private

  def person_params
    params.require(:seller).permit(:first_name,:last_name,:address,:mobile, user_attributes: [:email,:password,:password_confirmation])
  end
end
