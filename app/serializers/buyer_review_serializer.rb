class BuyerReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :body, :buyer_id, :supplier_id, :rating, :created_at, :updated_at
end
