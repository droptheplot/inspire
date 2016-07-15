class RulesController < ApplicationController
  def index
    @rules = Rule.includes(:tag).order(id: :desc).all
  end
end
