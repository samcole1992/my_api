class Bid < ApplicationRecord

  belongs_to :buyer
  has_many :products
  has_one :order
  
end
