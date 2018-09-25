class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :bid_id, :offer_id, :amount, :name, :price, :description, :updated_at, :created_at
end
