class Budget < ActiveRecord::Base
  has_many :users
  has_many :accounts
end
