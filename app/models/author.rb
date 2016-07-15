class Author < ApplicationRecord
  APPLY_RULES_COLUMN_NAME = 'biography'.freeze

  validates :name, presence: true
end
