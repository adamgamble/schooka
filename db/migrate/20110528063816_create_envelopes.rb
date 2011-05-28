class CreateEnvelopes < ActiveRecord::Migration
  def change
    create_table :envelopes do |t|
      t.integer :account_id
      t.string :name

      t.timestamps
    end
  end
end
