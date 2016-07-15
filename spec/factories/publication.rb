FactoryGirl.define do
  factory :publication, class: Publication do
    title { Faker::Hipster.sentence }
    content { Faker::Hipster.paragraph }
    author
    description { Faker::Hipster.paragraph }

    trait :poem do
      type 'Publication::Poem'
    end

    trait :short_story do
      type 'Publication::ShortStory'
    end

    trait :with_keyword do
      content 'Content with keyword'
    end

    trait :without_keyword do
      content 'Content without'
    end
  end
end
