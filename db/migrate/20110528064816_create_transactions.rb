class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.text :description
      t.decimal :amount, :precision => 10, :scale => 2
      t.integer :envelope_id

      t.timestamps
    end
  end
end
