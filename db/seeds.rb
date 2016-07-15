require 'faker'

def create_publication(type = :poem)
  publication = FactoryGirl.create(:publication, type)

  3.times do
    CreateTagService.new(publication, Faker::Hacker.noun).()
  end
end

5.times do
  create_publication(:poem)
  create_publication(:short_story)
end

10.times do
  FactoryGirl.create(:rule)
end
