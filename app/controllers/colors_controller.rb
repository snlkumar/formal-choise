class ColorsController < ApplicationController
  
  def index
    @color=Color.new
    @colors=Color.all
  end
  
  # def new
    # @brand=Color.new
  # end
#   
  def create
    @color=Color.new(color_params)
     @html=""
     @valid=true
     @messages=""
    if @color.save
      @colors=Color.all      
      @html=render_to_string(partial: 'colors')
      @messages="Category successfully created"
    else      
      @valid=false
      @messages= @color.errors.messages
    end
    respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  
 def update
    @color=Color.find params[:id]
    @valid=true
    @messages=""
    @html=""
    if @color.update_attributes(color_params)   
    @colors=Color.all
     @html=render_to_string(partial: 'colors')
      @messages="Category successfully updated"
    else
       @valid=false
      @messages= @color.errors.messages
    end
      respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  def destroy
     @color=Color.find params[:id]
     @valid=true
    @messages=""
    @html=""
    if @color.delete   
    @colors=Color.all
    @html=render_to_string(partial: 'colors')
      @messages="Category successfully deleted"
    else
      @valid=false
      @messages= @color.errors.messages
    end
    respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  
  
  
  def color_params
    params.require(:color).permit(:name,:status)
  end
end
