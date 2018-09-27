class AddDefaultToProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :name
    remove_column :products, :amount
      add_column :products, :name, :string, null: false, default: ''
      add_column :products, :amount, :integer, null: false, default: 0

  end
end
