FactoryGirl.define do
  factory :publication_poem, class: Publication::Poem do
    title { Faker::Hipster.sentence }
    content { Faker::Hipster.paragraph }
    author
    description { Faker::Hipster.paragraph }
    type 'Publication::Poem'
  end
end
