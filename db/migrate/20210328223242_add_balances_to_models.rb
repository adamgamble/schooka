class AddBalancesToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :cached_balance, :integer
    add_column :envelopes, :cached_balance, :integer
  end
end
