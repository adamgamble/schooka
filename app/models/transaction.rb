class Transaction < ActiveRecord::Base
  belongs_to :envelope
  validates_presence_of :name, :amount
end
