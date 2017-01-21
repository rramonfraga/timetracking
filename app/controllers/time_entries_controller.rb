class TimeEntriesController < ApplicationController
  def index
    @time_entries = project.time_entries.last_month
  end

  def new
    @time_entry = project.time_entries.new
  end

  def create
    @time_entry = project.time_entries.new(time_entry_params)
    if @time_entry.save
      redirect_to "/projects/#{project.id}/time_entries"
    else
      flash[:alert] = @time_entry.errors.full_messages
      render 'new'
    end
  end

  def edit
    time_entry
  end

  def update
    if time_entry.update(time_entry_params)
      redirect_to "/projects/#{project.id}/time_entries"
    else
      render 'edit'
    end
  end

  def destroy
    time_entry.destroy
    redirect_to "/projects/#{project.id}/time_entries"
  end

  private

  def project
    @project = Project.find_by(id: params[:project_id])
  end

  def time_entry
    @time_entry = project.time_entries.find_by(id: params[:id])
  end

  def time_entry_params
    params.require(:time_entry).permit(:hours, :minutes, :date, :comments)
  end







end
