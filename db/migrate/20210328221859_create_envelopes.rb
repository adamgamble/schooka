class CreateEnvelopes < ActiveRecord::Migration[6.1]
  def change
    create_table :envelopes do |t|
      t.string :name
      t.integer :account_id

      t.timestamps
    end
  end
end
