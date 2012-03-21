class AddBalanceCaches < ActiveRecord::Migration
  def up
    add_column :accounts, :balance_cache, :decimal, :precision => 10, :scale => 2
    add_column :envelopes, :balance_cache, :decimal, :precision => 10, :scale => 2
  end

  def down
  end
end
