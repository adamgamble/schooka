class Transaction < ActiveRecord::Base
  belongs_to :envelope
  after_commit :update_envelope_balance
  validates_presence_of :name, :amount

  scope :since, lambda { |date| where("transactions.created_at > ?",date)}

  def update_envelope_balance
    envelope.update_balance
  end
end
