class PublicationDecorator < DelegateClass(Publication)
  def by_author
    "#{__getobj__.model_name.human&.titleize} by #{__getobj__.author.name}"
  end
end
