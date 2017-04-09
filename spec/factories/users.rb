FactoryGirl.define do
  factory :user do
    first_name              { Faker::Name.first_name }
    last_name               { Faker::Name.last_name }
    email                   { Faker::Internet.email }
    password                { 'password' }
    password_confirmation   { 'password' }
    confirmed_at            Date.today
  end
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :account, :class => 'User' do
    first_name            'Jack'
    last_name             'Ripper'
    email
    password              '12345678'
    password_confirmation '12345678'
  end
end