class AddDateIssuedToBidsOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :date_issued, :datetime
    add_column :offers, :date_issued, :datetime
  end
end
