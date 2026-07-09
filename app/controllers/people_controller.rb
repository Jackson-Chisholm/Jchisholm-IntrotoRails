class PeopleController < ApplicationController
  def index
    @people = Person.includes(:quote).all
  end

  def spef
    @people = Person.find(params[:id])
  end
end
