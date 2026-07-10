class PeopleController < ApplicationController
  def index
    if params[:query].present?
      @people = Person.where("name LIKE ?", "%#{params[:query]}%")
    else
    @people = Person.where(id: 1)
    end
  end

  def show
    @people = Person.includes(:quote).all.page(params[:page])
  end

  def view
  end
end
