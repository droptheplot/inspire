class RulesController < ApplicationController
  def index
    @rules = Rule.includes(:tag).ordered.all
  end
end
