class Offer < ApplicationRecord

  belongs_to :supplier
  has_many :products
  has_one :order

end
