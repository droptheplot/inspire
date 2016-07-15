class Rule < ApplicationRecord
  belongs_to :tag

  validates :keyword, presence: true, uniqueness: true
end
