object @envelope
attributes :id, :name
child :transactions do
  attributes :id, :name, :amount
end
