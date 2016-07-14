FactoryGirl.define do
  factory :author do
    name { Faker::Name.name  }
    biography { Faker::Hipster.paragraph }
  end
end
