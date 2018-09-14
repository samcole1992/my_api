class BuyerReview < ApplicationRecord

  has_one :buyer
  belongs_to :supplier
  
end
