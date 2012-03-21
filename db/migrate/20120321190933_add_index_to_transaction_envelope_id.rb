class AddIndexToTransactionEnvelopeId < ActiveRecord::Migration
  def change
    add_index :transactions, :envelope_id
    add_index :envelopes, :account_id
  end
end
