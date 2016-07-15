class Publication < ApplicationRecord
  include Taggable
  include Rulable

  belongs_to :author

  validates :title, presence: true
end
