class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|

      t.integer "amount", null: false
      t.timestamps
    end
  end
end
