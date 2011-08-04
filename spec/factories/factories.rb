# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
      email_address { Faker::Internet.email }
      password "changeme"
      password_confirmation "changeme"
  end

  factory :budget do
      name { Faker::Internet.domain_name }
  end

  factory :account do
      name { Faker::Company.name }
  end

  factory :envelope do
      name { Faker::Company.name }
  end

  factory :transaction do
      name   { Faker::Company.name }
      amount { BigDecimal((rand * 1000).round(2).to_s) }
  end
end
