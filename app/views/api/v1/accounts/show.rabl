object @account
attributes :id, :name
code :balance do |a|
  a.balance
end
child :envelopes do
  attributes :id, :name
  code :balance do |e|
    e.balance
  end
end
