class BidSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :buyer_id, :supplier_id, :created_at, :updated_at, :total
end
