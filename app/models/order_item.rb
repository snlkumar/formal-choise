class OrderItem < ActiveRecord::Base
   belongs_to :order
   belongs_to :product
   
  def unit_price
    Product.find(product_id)
  end

  def title
    Product.find(product_id, :select => "title", :limit => 1).title
  end
  
  def sub_total
    unit_price.price * quantity
  end
end
