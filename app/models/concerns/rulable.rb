module Rulable
  extend ActiveSupport::Concern

  included do
    after_commit :apply_rules, on: :create
  end

  private

    def apply_rules
      ApplyRulesJob.perform_now(self.class, id)
    end
end
