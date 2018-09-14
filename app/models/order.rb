class Order < ApplicationRecord

  belongs_to :bid
  belongs_to :offer
  has_one :buyer, through: :bids
  has_one :supplier, through: :offers

end
