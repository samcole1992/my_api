class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :created_at, :updated_at
end
