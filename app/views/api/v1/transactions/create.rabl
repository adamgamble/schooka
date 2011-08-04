object @transaction
attributes :id, :created_at, :name, :amount
code :success do |t|
  t.valid?
end
code :errors do |t|
  t.errors.full_messages
end
