require 'faker'

def create_publication(type = :publication_poem)
  publication = FactoryGirl.create(type)

  3.times do
    CreateTagService.new(publication, Faker::Hacker.noun).()
  end
end

5.times do
  create_publication(:publication_poem)
  create_publication(:publication_short_story)
end
