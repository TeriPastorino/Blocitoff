FactoryGirl.define do
   factory :user do
     name "Test User"
     sequence(:email, 100) { |n| "person#{n}@example.com" }
     password "password"
     password_confirmation "password"
     confirmed_at Time.now
   end
 end
