class Buyer < ActiveRecord::Base
  belongs_to :product
  has_one :user
  accepts_nested_attributes_for :user
end
