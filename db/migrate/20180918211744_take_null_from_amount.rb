class TakeNullFromAmount < ActiveRecord::Migration[5.0]
  def change
    remove_column :bids, :amount
    remove_column :offers, :amount
  end
end
