FactoryGirl.define do
  factory :user do
    name { FFaker::Name.first_name }
    sequence(:email) { "#{name}#{SecureRandom.hex(1)}@example.com" }
    password 'password'
  end
end
