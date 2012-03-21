class Account < ActiveRecord::Base
  belongs_to :budget
  has_many :envelopes
  has_many :transactions, :through => :envelopes

  def balance
    update_balance if balance_cache.nil?
    balance_cache
  end

  def update_balance
    update_attribute(:balance_cache, transactions.sum(:amount).round(2))
  end

  def to_s
    _balance = balance
    if _balance < BigDecimal("0")
      str_balance = "$(#{_balance.abs.to_s})"
    else
      str_balance = "$#{_balance.to_s}"
    end
    "#{name}  #{str_balance}"
  end
end
