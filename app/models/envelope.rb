class Envelope < ActiveRecord::Base
  belongs_to :account
  has_many :transactions

  def balance
    transactions.sum(:amount)
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
