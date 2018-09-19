class AddDeletedAtToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :bids, :deleted_at, :datetime
    add_column :offers, :deleted_at, :datetime

  end
end
