FactoryGirl.define do
  factory :comment do
    body        { Faker::Lorem.paragraph }
    post_id     { 1 } # Hard coded this, there is no way to know if we have a user with id of 1. wasn't sure how to get an existing user_id
    user_id     { 1 } # Hard coded this, there is no way to know if we have a user with id of 1. wasn't sure how to get an existing user_id
  end
end