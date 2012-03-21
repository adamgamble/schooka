object @accounts
attributes :id
code :account_name do |p|
  p.name
end

code :account_name_with_balance do |p|
  "#{p.name} - #{number_to_currency(p.balance)}"
end

code :balance do |p|
  p.balance
end
