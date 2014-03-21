class Product < ActiveRecord::Base
  acts_as_votable
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
  accepts_nested_attributes_for :images, allow_destroy: true
end
