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
     @html=""
     @valid=true
     @messages=""
    if @brand.save
      @brands=Brand.all      
      @html=render_to_string(partial: 'brands')
      @messages="Brand successfully created"
    else      
      @valid=false
      @messages= @brand.errors.messages
    end
    respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  
  def update
    @brand=Brand.find params[:id]
    @valid=true
    @messages=""
    @html=""
    if @brand.update_attributes(brand_params)   
    @brands=Brand.all
     @html=render_to_string(partial: 'brands')
      @messages="Brand successfully updated"
    else
       @valid=false
      @messages= @brand.errors.messages
    end
      respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  def destroy
     @brand=Brand.find params[:id]
     @valid=true
    @messages=""
    @html=""
    if @brand.delete   
    @brands=Brand.all
    @html=render_to_string(partial: 'brands')
      @messages="Brand successfully deleted"
    else
      @valid=false
      @messages= @brand.errors.messages
    end
    respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  
  
  
  def brand_params
    params.require(:brand).permit(:name,:status)
  end
  
end
