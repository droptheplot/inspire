class Publication < ApplicationRecord
  belongs_to :author

  validates :title, presence: true

  after_commit :apply_rules, on: :create

  def tags
    Tag.includes(:taggings)
       .where(
         taggings: {
           taggable_type: 'Publication',
           taggable_id: id
         }
       )
  end

  private

    def apply_rules
      ApplyRulesJob.perform_now(id)
    end
end
