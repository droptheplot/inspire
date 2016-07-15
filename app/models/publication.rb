class Publication < ApplicationRecord
  APPLY_RULES_COLUMN_NAME = 'content'.freeze

  include Taggable
  include Rulable

  belongs_to :author

  validates :title, :type, presence: true

  def type=(value)
    klass = begin
              value.constantize
            rescue NameError
              "publication/#{value}".classify.constantize
            end

    write_attribute(:type, klass.to_s)
  end
end
