class AddDeletedAtToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :deleted_at, :datetime
    add_index :books, :deleted_at

    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at

    add_column :reserves, :deleted_at, :datetime
    add_index :reserves, :deleted_at
  end
end
