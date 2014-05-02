class ProductsController < ApplicationController
  before_filter :login_required,:except=>[:product_show]
  def index
    @seller=current_user.seller
    @products=@seller.products    
  end
  
  def new
    @seller=current_user.seller
    @product=Product.new
    @product.images.build 
  end
  
  def create
    @product=Product.new(product_params)
     if @product.save
      redirect_to seller_products_path(current_user.seller),:notice => 'Product was successfully created.'
    else
      render 'new'
    end  
  end
  
  def edit
    @seller=Seller.find params[:seller_id]
    @product=Product.find params[:id]
    render "new"
  end
   def update
    @seller=Seller.find params[:seller_id]
    @product=Product.find params[:id]
    if @product.update_attributes(product_params)
      redirect_to seller_products_path(@seller),:notice => 'Product was successfully updated.'
    else
      render 'new'
    end 
  end
  
  def show
    @seller=Seller.find params[:seller_id]
    @product=Product.find params[:id]
  end
  def product_show
    @product=Product.find(params[:id],:include=>[:brand,:color,:category])
     @cart = Cart.last
    @line_item=LineItem.new
    render layout: 'user'
  end
  private
  def product_params
    params.require(:product).permit(:name,:brand_id,:price,:color_id,:category_id,:seasion_id,:seller_id,:description,images_attributes: [:id,:image,:image_file_name,:image_content_type,:image_file_size,:image_updated_at,:_destroy])
  end
  
end
