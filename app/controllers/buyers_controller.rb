class BuyersController < ApplicationController  
   before_filter :activate_user
   before_filter :buyer_required,only: [:cart]
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
   def orders
    @orders = current_user.orders if current_user.user?
  end

  def order_items
    @order = Order.find_by_id(params[:id])
  end

  def cart   
    puts "the request is#{request.post?}"
    if !session[:order].present?
      @order = current_user.buyer.orders.create(:order_status => "initiated")
      @product = @order.order_items.create(:product_id => params[:product_id], :quantity => 1)
      if @order.present? && @product.present?
        session[:order] = 1
        session[:order_id] = @order.id
      end
    else
      if session[:order_id].present?
        @order = Order.find_by_id(session[:order_id])
        if request.post?
        @order_item = @order.order_items.find_by_product_id(params[:product_id])
        if @order_item.present?          
          @order_item.quantity += 1
          @item =@order_item.save
        else
          @item = OrderItem.create(:order_id => @order.id, :product_id => params[:product_id], :quantity => 1)
        end
        session[:order] += 1 if @item.present?
        end
      end
    end    
    render layout: "user"
  end

  def clear_cart
    if session[:order_id].present?
      @order = Order.find_by_id(session[:order_id])
      if @order.destroy
        session[:order] = ""
        session[:order_id] = ""
        redirect_to root_path
      end
    end
  end

  def checkout
    if session[:order_id].present?
      @order = Order.find_by_id(session[:order_id])
    end
    if request.post?
      @order.update_attributes(:order_amount => params[:order][:order_amount], :tax_price => params[:order][:tax_price], :order_status => "completed")
      if @order.save
        session[:order] = ""
        session[:order_id] = ""
        redirect_to user_myorders_path 
      end
    end
  end

  def show_product_details
    @product = Product.find(params[:id])
  end

  
   private

  def buyer_params
    params.require(:buyer).permit(:first_name,:last_name,:address,:mobile, user_attributes: [:email,:password,:password_confirmation])
  end
end
