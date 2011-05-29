class User < ActiveRecord::Base
  has_secure_password
  belongs_to :budget
  has_many :accounts, :through => :budget
  has_many :envelopes, :through => :accounts
  has_many :transactions, :through => :envelopes
end
