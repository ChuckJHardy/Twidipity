FactoryGirl.define do
  factory :statement do
    user

    follow 2
    duration 864_00

    factory :statement_with_suggestion do
      transient do
        suggestion_ending_at DateTime.now + 2.days
      end

      status :active

      after(:create) do |statement, evaluator|
        statement.update_attributes!(
          ending_at: evaluator.suggestion_ending_at,
          suggestion: create(:suggestion)
        )
      end
    end
  end
end
