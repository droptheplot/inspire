module Taggable
  extend ActiveSupport::Concern

  def tags
    Tag.includes(:taggings)
       .where(
         taggings: {
           taggable_type: self.class.to_s,
           taggable_id: id
         }
       )
  end
end
