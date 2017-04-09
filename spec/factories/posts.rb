FactoryGirl.define do
  factory :post do
    title       { Faker::Beer.name }
    body        { Faker::Lorem.paragraph }
    user_id     { 1 } # Hard coded this, there is no way to know if we have a user with id of 1. wasn't sure how to get an existing user_id
  end
end