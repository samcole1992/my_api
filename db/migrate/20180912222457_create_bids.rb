class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      
      t.integer "amount", null: false
      t.timestamps
    end
  end
end
