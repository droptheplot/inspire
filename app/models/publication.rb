class Publication < ApplicationRecord
  belongs_to :author

  validates :title, presence: true

  def tags
    Tag.includes(:taggings)
       .where(
         taggings: {
           taggable_type: 'Publication',
           taggable_id: id
         }
       )
  end
end
