FactoryGirl.define do
  factory :statement do
    user

    follow 2
    duration 2

    factory :statement_with_suggestions do
      transient do
        suggestions_count 1
      end

      after(:create) do |statement, evaluator|
        statement.suggestions = create_list(
          :suggestion, evaluator.suggestions_count
        )
      end
    end
  end
end
