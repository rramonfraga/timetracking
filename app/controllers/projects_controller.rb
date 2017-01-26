class ProjectsController < ApplicationController
  def index
    @projects = Project.order(created_at: :asc)
                       .limit(10)
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

  private

  def project_params
    params.require(:project).permit(:name, :description, :logo)
  end
end
