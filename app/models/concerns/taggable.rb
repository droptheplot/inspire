module Taggable
  extend ActiveSupport::Concern

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
