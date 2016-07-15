class Author < ApplicationRecord
  APPLY_RULES_COLUMN_NAME = 'biography'.freeze

  include Taggable
  include Rulable

  validates :name, presence: true
end
