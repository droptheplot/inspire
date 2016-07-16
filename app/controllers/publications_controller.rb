class PublicationsController < ApplicationController
  before_action :set_type, only: [:new, :create]
  before_action :set_rules, only: [:new, :create]

  def index
    @publications = Publication.includes(:tags).order(id: :desc).all
  end

  def show
    @publication = PublicationDecorator.new(
      Publication.find(params[:id])
    )
  end

  def new
    @publication = publication_klass.new
  end

  def create
    @publication = publication_klass.new(publication_params)

    if @publication.save
      redirect_to root_path, notice: 'Publication has been successfully created.'
    else
      flash.now[:alert] = @publication.errors.full_messages.first
      render :new
    end
  end

  private

    def publication_params
      params.require(:publication)
            .permit(:title, :content, :author_id, :description, :metaphor)
    end

    def set_type
      @type = params.dig(:publication, :type) || params.dig(:type)
    end

    def set_rules
      @rules = Rule.includes(:tag).ordered.all
    end

    def publication_klass
      "publication/#{@type}".classify.constantize
    end
end
