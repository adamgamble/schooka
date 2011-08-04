class Envelope < ActiveRecord::Base
  belongs_to :account
  has_many :transactions

  def balance
    transactions.sum(:amount).round(2)
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

  def can_debit_for? amount
    amount = BigDecimal(amount) if amount.is_a?(String)
    !(amount > balance)
  end
end
