FactoryGirl.define do
  factory :log do
    user
    time_in { Time.current }

    trait :with_time_out do
      time_out { 1.hour.from_now }
    end
  end
end
