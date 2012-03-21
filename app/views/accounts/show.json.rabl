object @account.envelopes
attributes :name

code :name_with_balance do |p|
  "#{p.name} - #{number_to_currency(p.balance)}"
end
