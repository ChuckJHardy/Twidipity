FactoryGirl.define do
  factory :follow do
    statement
    sequence(:tuid, 260_000)
  end
end
