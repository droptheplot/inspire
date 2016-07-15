class AuthorsController < ApplicationController
  def index
    @authors = Author.includes(:tags).order(id: :desc).all
  end
end
