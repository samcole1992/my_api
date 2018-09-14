class SupplierReview < ApplicationRecord
  has_one :supplier
  belongs_to :buyer
end
