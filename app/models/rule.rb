class Rule < ApplicationRecord
  MAX_COUNT = 20

  belongs_to :tag

  validates :keyword, presence: true, uniqueness: true
  validate :validate_count, on: :create

  scope :ordered, -> { order(id: :desc) }

  private

    def validate_count
      return if self.class.count < MAX_COUNT

      errors.add(:base, "only #{MAX_COUNT} rules allowed")
    end
end
