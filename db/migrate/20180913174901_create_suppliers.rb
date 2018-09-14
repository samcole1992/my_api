class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      
      t.string "email", null: false
      t.string "first_name"
      t.string "last_name"

      t.timestamps
    end
  end
end
