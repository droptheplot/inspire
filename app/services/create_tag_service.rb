class CreateTagService
  # @param taggable [ActiveRecord::Base]
  # @param name [String]
  def initialize(taggable, name)
    @taggable = taggable
    @name = name
  end

  def call
    ActiveRecord::Base.transaction do
      tag = Tag.where(name: @name).first_or_create
      Tagging.where(taggable: @taggable, tag: tag).first_or_create
    end
  end
end
