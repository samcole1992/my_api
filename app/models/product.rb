class Product < ApplicationRecord

  has_many :offers
  has_many :bids

end
