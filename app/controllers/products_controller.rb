class ProductsController < ApplicationController
  
  def index
    seller=current_user.seller
    @products=seller.products    
  end
  
  def new
    @seller=current_user.seller
    @product=Product.new
  end
  
end
