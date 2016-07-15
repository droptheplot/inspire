FactoryGirl.define do
  factory :rule do
    keyword { Faker::Hacker.noun }
    tag nil
  end
end
