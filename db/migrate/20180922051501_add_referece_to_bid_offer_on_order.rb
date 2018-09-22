class AddRefereceToBidOfferOnOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :bid, index: true
    add_reference :orders, :offer, index: true
    add_foreign_key :orders, :bids
    add_foreign_key :orders, :offers
  end
end
