class Product < ActiveRecord::Base
  belongs_to :seller
  belongs_to :brand
  belongs_to :category
  belongs_to :color
  belongs_to :seasion
  has_many :tags
  has_many :reviews
  has_many :ratings  
  has_many :images
  has_many :buyers
end
