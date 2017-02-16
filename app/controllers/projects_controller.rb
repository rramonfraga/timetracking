class ProjectsController < ApplicationController
  def index
    @projects = Project.get_first_created(10)
    render 'index'
  end

  def show
    @project = Project.find_by(id: params[:id])
    if @project.present?
      render :show
    else
      render file: 'public/404.html'
    end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to "/projects/#{@project.id}"
    else
      flash[:error] = @project.errors.message
      render 'new'
    end
  end

  def finish
    @project = Project.new(project_params)
    @project.finish!
    redirect_to
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :logo)
  end
end
