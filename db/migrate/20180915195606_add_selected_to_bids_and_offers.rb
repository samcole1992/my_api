class AddSelectedToBidsAndOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :fulfilled, :boolean
    add_column :offers, :fulfilled, :boolean


    add_column :orders, :buyer_fulfilled, :boolean
    add_column :orders, :supplier_fulfilled, :boolean
    add_column :orders, :fulfilled, :boolean

    add_reference :orders, :supplier, index: true
    add_reference :orders, :buyer, index: true

    add_foreign_key :orders, :buyers
    add_foreign_key :orders, :suppliers

    add_reference :notifications, :order, index: true
    add_reference :notifications, :buyer, index: true
    add_reference :notifications, :supplier, index: true

    add_foreign_key :notifications, :buyers
    add_foreign_key :notifications, :suppliers
    add_foreign_key :notifications, :orders

    add_reference :products, :bid, index: true
    add_reference :products, :offer, index: true

    add_foreign_key :products, :bids
    add_foreign_key :products, :offers

    add_reference :buyer_reviews, :buyer, index: true
    add_reference :buyer_reviews, :supplier, index: true

    add_foreign_key :buyer_reviews, :buyers
    add_foreign_key :buyer_reviews, :suppliers

    add_reference :supplier_reviews, :buyer, index: true
    add_reference :supplier_reviews, :supplier, index: true

    add_foreign_key :supplier_reviews, :buyers
    add_foreign_key :supplier_reviews, :suppliers
  end
end
