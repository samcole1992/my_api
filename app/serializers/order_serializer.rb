class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :buyer_id, :supplier_id, :updated_at, :created_at, :deleted_at, :fulfilled, :buyer_fulfilled, :supplier_fulfilled,:buyer_notes, :supplier_notes, :bid_id, :offer_id, :total
end
