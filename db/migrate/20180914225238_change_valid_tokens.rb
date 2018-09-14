class ChangeValidTokens < ActiveRecord::Migration[5.0]
  def change
    remove_column :buyers, :valid_token
    remove_column :suppliers, :valid_token
      add_column :buyers, :valid_token, :string
      add_column :suppliers, :valid_token, :string

  end
end
