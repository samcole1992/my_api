class AddValidtokenTobuyerAndSupplier < ActiveRecord::Migration[5.0]
  def change
    add_column :buyers, :valid_token, :integer
    add_column :suppliers, :valid_token, :integer

  end
end
