class SupplierSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :created_at, :updated_at, :valid_token
end
