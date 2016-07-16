class ApplyRulesJob < ApplicationJob
  queue_as :default

  # @param klass [ActiveRecord::Base]
  # @param id [Integer]
  def perform(klass, id)
    obj = klass.find(id)

    return unless obj

    rules = Rule.all

    rules.each do |rule|
      next unless obj.public_send(klass::APPLY_RULES_COLUMN_NAME)
                     .include?(rule.keyword)

      CreateTagService.new(obj, rule.tag.name).()
    end
  end
end
