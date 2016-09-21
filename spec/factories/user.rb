FactoryGirl.define do
  factory :user do
    name { FFaker::Name.first_name }
    sequence(:email) { "#{name}#{SecureRandom.hex(1)}@example.com" }
    password 'password'

    factory :user_with_log do
      after :build do |user|
        user.logs << build(:log, :with_time_out, user: user)
      end
    end
  end
end
