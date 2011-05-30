class Budget < ActiveRecord::Base
  has_many :users
  has_many :accounts
  has_many :transactions, :through => :accounts
end
