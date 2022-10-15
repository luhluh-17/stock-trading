class RenameColumnNameTickerInStock < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :stocks, :ticker, :symbol
  end

  def self.down; end
end
