class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true


  has_many :orders, -> { joins(:bids, :offers) }, class_name: 'Order'

  has_many :comments

  has_many :bids
  has_many :offers


  has_many :buyers, class_name: "User", foreign_key: "buyer_id", through: :orders
  has_many :suppliers, class_name: "User", foreign_key: "supplier_id", through: :orders



end
