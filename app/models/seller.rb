class Seller < ActiveRecord::Base
  has_many :products  
  has_one :user
  accepts_nested_attributes_for :user
end
