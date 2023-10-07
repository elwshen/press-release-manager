class AddForeignKeyToUser < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :publishers, :users
    add_foreign_key :organizations, :users
  end
end
