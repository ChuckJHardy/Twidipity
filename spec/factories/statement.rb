FactoryGirl.define do
  factory :statement do
    user

    follow 2
    duration 2

    factory :statement_with_suggestions do
      transient do
        suggestions_count 1
        suggestions_ending_at DateTime.now + 2.days
      end

      status :active

      after(:create) do |statement, evaluator|
        statement.update_attributes!(
          ending_at: evaluator.suggestions_ending_at,
          suggestions: create_list(:suggestion, evaluator.suggestions_count)
        )
      end
    end
  end
end
