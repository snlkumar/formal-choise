class CategoriesController < ApplicationController
  def index
    @category=Category.new
    @categories=Category.all
  end
  
  def new
    @brand=Category.new
  end
  
  def create
    @category=Category.new(category_params)
     @html=""
     @valid=true
     @messages=""
    if @category.save
      @categories=Category.all      
      @html=render_to_string(partial: 'categories')
      @messages="Category successfully created"
    else      
      @valid=false
      @messages= @category.errors.messages
    end
    respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  
 def update
    @category=Category.find params[:id]
    @valid=true
    @messages=""
    @html=""
    if @category.update_attributes(category_params)   
    @categories=Category.all
     @html=render_to_string(partial: 'categories')
      @messages="Category successfully updated"
    else
       @valid=false
      @messages= @category.errors.messages
    end
      respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  def destroy
     @category=Category.find params[:id]
     @valid=true
    @messages=""
    @html=""
    if @category.delete   
    @categories=Category.all
    @html=render_to_string(partial: 'categories')
      @messages="Category successfully deleted"
    else
      @valid=false
      @messages= @category.errors.messages
    end
    respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  
  
  
  def category_params
    params.require(:category).permit(:name,:status)
  end
end
