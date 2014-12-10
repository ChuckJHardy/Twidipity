FactoryGirl.define do
  factory :user do
    sequence(:uid, 1800) { |number| "#{number}abc" }
    sequence(:token, 123)
    sequence(:secret, 987)
    role 0
  end
end
