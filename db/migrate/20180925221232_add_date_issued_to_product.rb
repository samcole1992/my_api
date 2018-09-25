class AddDateIssuedToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :date_issued, :datetime

  end
end
