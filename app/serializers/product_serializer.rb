class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :bid_id, :offer_id, :amount, :name, :price
end
