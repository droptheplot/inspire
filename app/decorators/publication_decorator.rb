class PublicationDecorator < DelegateClass(Publication)
  def signature
    format(
      '%s published by %s, %s ago.',
      __getobj__.model_name.human&.titleize,
      __getobj__.author.name,
      ActionController::Base.helpers.time_ago_in_words(__getobj__.created_at)
    )
  end
end
