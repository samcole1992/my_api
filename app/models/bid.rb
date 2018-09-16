class Bid < ApplicationRecord

  belongs_to :buyer
  has_many :products
  has_one :order

  def total
    	self.products.sum(:price) # fires db query
  	end


end
