class PeopleController < ApplicationController
  def index
    @people = Person.where(id: 1)
  end

  def show
    @people = Person.includes(:quote).all
  end

  def spef
    @people = Person.find(params[:id])
  end
end
