class OfferSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :buyer_id, :supplier_id, :created_at,:date_issued, :updated_at, :total
end
