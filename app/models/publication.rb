class Publication < ApplicationRecord
  APPLY_RULES_COLUMN_NAME = 'content'.freeze

  include Taggable
  include Rulable

  belongs_to :author

  validates :title, presence: true
end
