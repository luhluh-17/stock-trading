class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :ticker
      t.float :amount
      t.integer :percentage
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
