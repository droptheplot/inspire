FactoryGirl.define do
  factory :rule do
    sequence :keyword do |n|
      "#{Faker::Hacker.noun}-#{n}"
    end
    
    tag
  end
end
