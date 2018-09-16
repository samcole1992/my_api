class SupplierSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :created_at, :updated_at, :valid_token, :first_name, :last_name, :title, :rating
end
