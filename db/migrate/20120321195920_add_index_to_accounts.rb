class AddIndexToAccounts < ActiveRecord::Migration
  def change
    add_index :accounts, :budget_id
  end
end
