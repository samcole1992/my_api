class AddRatingToBuyerAndSupplier < ActiveRecord::Migration[5.0]
  def change
    add_column :buyers, :rating, :decimal
    add_column :suppliers, :rating, :decimal

  end
end
