class PeopleController < ApplicationController

  def show
    @person = Person.find_by(id: params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to person_path(@person)
    else
      render 'new'
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, :age, :project)
  end
end
