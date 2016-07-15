class Tag < ApplicationRecord
  has_many :taggings
  has_many :publications, through: :taggings, source: :taggable,
           source_type: 'Publication'
  has_many :authors, through: :taggings, source: :taggable,
           source_type: 'Author'

  validates :name, presence: true, uniqueness: true
end
