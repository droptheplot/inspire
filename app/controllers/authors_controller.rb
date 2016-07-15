class AuthorsController < ApplicationController
  def index
    @authors = Author.includes(:tags).all
  end
end
