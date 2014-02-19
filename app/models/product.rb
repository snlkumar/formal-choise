class Product < ActiveRecord::Base
  belongs_to :seller
  has_many :buyers
end
