module Taggable
  extend ActiveSupport::Concern

  def tags
    Tag.includes(:taggings)
       .where(
         taggings: {
           taggable_type: get_taggable_type,
           taggable_id: id
         }
       )
  end

  private

    def get_taggable_type
      (namespaced? ? self.class.superclass : self.class).name
    end

    def namespaced?
      self.class.name.include?('::')
    end
end
