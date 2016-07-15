class PublicationsController < ApplicationController
  def index
    @publications = Publication.includes(:tags).all
  end

  def show
    @publication = Publication.find(params[:id])
  end
end
