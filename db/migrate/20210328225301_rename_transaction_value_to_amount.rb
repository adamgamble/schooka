class RenameTransactionValueToAmount < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :value, :amount
  end
end
