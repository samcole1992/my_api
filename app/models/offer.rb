class Offer < ApplicationRecord
acts_as_paranoid
  belongs_to :supplier
  has_many :products
  has_one :order

  def total
    	self.products.sum(:price) # fires db query
  	end

end
