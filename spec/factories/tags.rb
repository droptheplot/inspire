FactoryGirl.define do
  factory :tag do
    sequence :name do |n|
      "#{Faker::Hacker.noun}#{n}"
    end
  end
end
