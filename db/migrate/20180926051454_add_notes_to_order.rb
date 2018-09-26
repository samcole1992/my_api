class AddNotesToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :buyer_notes, :text
    add_column :orders, :supplier_notes, :text
  end
end
