class Transaction < ActiveRecord::Base
  belongs_to :envelope
  validates_presence_of :name, :amount

  scope :since, lambda { |date| where("transactions.created_at > ?",date)}
end
