class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.float :amount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
