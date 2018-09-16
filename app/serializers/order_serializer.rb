class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :buyer_id, :supplier_id, :created_at, :buyer_fulfilled,:supplier_fulfilled,:fulfilled,:updated_at, :total
end
