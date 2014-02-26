class BrandsController < ApplicationController
  
  
  def index
    @brand=Brand.new
    @brands=Brand.all
  end
  
  def new
    @brand=Brand.new
  end
  
  def create
    @brand=Brand.new(brand_params)
    if @brand.save
      @brands=Brand.all
      render partial: "brands"
    else
      puts @brand.errors.messages
      render text: @brand.errors.messages
    end
  end
  
  def update
    @brand=Brand.find params[:id]
    @brand.update_attributes(brand_params)   
    @brands=Brand.all
      render partial: "brands"
  end
  def destroy
     @brand=Brand.find params[:id]
    @brand.delete   
    @brands=Brand.all
      render partial: "brands"
  end
  
  
  
  def brand_params
    params.require(:brand).permit(:name,:status)
  end
  
end
