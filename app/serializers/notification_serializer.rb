class NotificationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at, :updated_at, :order_id, :buyer_id, :supplier_id
end
