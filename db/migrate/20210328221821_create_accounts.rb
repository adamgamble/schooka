class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :organization_id

      t.timestamps
    end
  end
end
