class Account < ApplicationRecord
  belongs_to :organization
  has_many :envelopes
end
