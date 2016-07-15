FactoryGirl.define do
  factory :publication_short_story, class: Publication::ShortStory do
    title { Faker::Hipster.sentence }
    content { Faker::Hipster.paragraph }
    author
    description { Faker::Hipster.paragraph }
    type 'Publication::ShortStory'
  end
end
