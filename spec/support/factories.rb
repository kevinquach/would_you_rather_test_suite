FactoryGirl.define do
  factory :question do
    sequence(:description) {|n| "question #{n} description" }

    trait :with_options do
      after :create do |question|
        FactoryGirl.create_list(:option, 2, question: question)
      end
    end

    factory :question_with_options, traits: [:with_options]
  end

  factory :option do
    question
    sequence(:content) {|n| "be a super hero number #{n}"}
  end

  factory :vote do
    option
  end
end

