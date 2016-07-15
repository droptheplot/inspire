class PublicationsController < ApplicationController
  def index
    @publications = Publication.includes(:tags).order(id: :desc).all
  end

  def show
    @publication = Publication.find(params[:id])
  end
end
