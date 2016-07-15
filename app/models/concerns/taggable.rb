module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, foreign_key: :taggable_id
    has_many :tags, through: :taggings
  end
end
