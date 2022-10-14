class FixColumnNameTicker < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :products, :ticker, :symbol
  end

  def self.down; end
end
