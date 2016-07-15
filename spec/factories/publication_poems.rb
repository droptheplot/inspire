FactoryGirl.define do
  factory :publication_poem, class: Publication::Poem do
    title { Faker::Hipster.sentence }
    content { Faker::Hipster.paragraph }
    author
    description { Faker::Hipster.paragraph }
    type 'Publication::Poem'

    trait :with_keyword do
      content 'Content with keyword'
    end

    trait :without_keyword do
      content 'Content without'
    end
  end
end
