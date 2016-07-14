FactoryGirl.define do
  factory :publication do
    title { Faker::Hipster.sentence }
    content { Faker::Hipster.paragraph }
    author nil
    description { Faker::Hipster.paragraph }
  end
end
