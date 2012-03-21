collection @envelopes
attributes :id, :name
code :balance do |e|
  e.balance
end
