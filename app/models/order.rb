class Order < ActiveRecord::Base
  belongs_to :buyer
  has_many :order_items
  has_many :line_items
  # monetize :order_amount_cents
  # monetize :tax_price_cents

  # scope :completed, where(:order_status => :completed)
  # scope :today, completed.merge(where("created_at >= ?", Time.zone.now.beginning_of_day))


  # def self.today_sales
    # Money.new(order.today.sum(:order_amount_cents), :EUR)
  # end

  def sub_totals    
    order_items.map { |i| i.sub_total}.sum(:price)
  end

  def tax_amount
    (sub_totals*21/ 100)
  end

  def grant_total
    sub_totals + sub_totals*21/ 100
  end
  # validates :name, :address, :email
  # def add_line_items_from_cart(cart)
    # cart.line_items.each do |item|
      # item.cart_id = nil
      # line_items << item
    # end
  # end
end
