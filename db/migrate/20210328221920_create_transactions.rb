class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.string :value
      t.integer :envelope_id

      t.timestamps
    end
  end
end
