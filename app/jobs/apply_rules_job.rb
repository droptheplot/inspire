class ApplyRulesJob < ApplicationJob
  queue_as :default

  def perform(publication_id)
    publication = Publication.find(publication_id)

    return unless publication

    rules = Rule.all

    rules.each do |rule|
      return unless publication.content.include?(rule.keyword)

      CreateTagService.new(publication, rule.tag.name).()
    end
  end
end
