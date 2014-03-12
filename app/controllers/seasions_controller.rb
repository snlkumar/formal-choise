class SeasionsController < ApplicationController
  def index
    @seasion=Seasion.new
    @seasions=Seasion.all
  end
  
  # def new
    # @brand=Color.new
  # end
#   
  def create
    @seasion=Seasion.new(seasion_params)
     @html=""
     @valid=true
     @messages=""
    if @seasion.save
      @seasions=Seasion.all      
      @html=render_to_string(partial: 'seasions')
      @messages="Seasion successfully created"
    else      
      @valid=false
      @messages= @seasion.errors.messages
    end
    respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  
 def update
    @seasion=Seasion.find params[:id]
    @valid=true
    @messages=""
    @html=""
    if @seasion.update_attributes(seasion_params)   
    @seasions=Seasion.all
     @html=render_to_string(partial: 'seasions')
      @messages="Seasion successfully updated"
    else
       @valid=false
      @messages= @seasion.errors.messages
    end
      respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  def destroy
     @seasion=Seasion.find params[:id]
     @valid=true
    @messages=""
    @html=""
    if @seasion.delete   
    @seasion=Seasion.all
    @html=render_to_string(partial: 'seasions')
      @messages="Seasion successfully deleted"
    else
      @valid=false
      @messages= @seasion.errors.messages
    end
    respond_to do |format|
     format.json { render json:  {valid: @valid,html: @html,message: @messages} }
   end
  end
  
  
  
  def seasion_params
    params.require(:seasion).permit(:name,:status)
  end
end
