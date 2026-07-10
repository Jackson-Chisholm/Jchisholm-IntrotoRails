class PeopleController < ApplicationController
  def index
    if params[:query].present?
      @people = Person.where("name LIKE ?", "%#{params[:query]}%")
    else
    @people = Person.where(id: 1)
    end
  end

  def show
    @people = Person.includes(:quote).all
  end

  def spef
    @people = Person.find(params[:id])
  end
end
