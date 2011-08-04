collection @accounts
attributes :id, :name
code :balance do |a|
  a.balance
end
