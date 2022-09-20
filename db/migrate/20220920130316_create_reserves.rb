class CreateReserves < ActiveRecord::Migration[7.0]
  def change
    create_table :reserves do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :reserve_date, null: false
      t.datetime :devolution_date, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
