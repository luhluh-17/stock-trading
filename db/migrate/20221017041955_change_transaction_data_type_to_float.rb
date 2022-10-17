class ChangeTransactionDataTypeToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column(:transactions, :amount, :float)
  end
end
