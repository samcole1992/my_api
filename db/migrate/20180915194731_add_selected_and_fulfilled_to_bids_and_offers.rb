class AddSelectedAndFulfilledToBidsAndOffers < ActiveRecord::Migration[5.0]
  def change

    add_reference :bids, :supplier, index: true
    add_reference :bids, :buyer, index: true

    add_foreign_key :bids, :suppliers

    add_reference :offers, :buyer, index: true
    add_reference :offers, :supplier, index: true

    add_foreign_key :offers, :buyers

  end
end
