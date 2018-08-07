class ProjectsController < ApplicationController

  def index
    @msg = Project.all
    render :json => @msg
  end

  def create
    project = Project.new project_params
     if project.save
      redirect_to projects_url
    else
      render :new
    end
  end

  def show
    @msg = Project.find_by id: params[:id]
    render :json => @msg
  end

  private

  def project_params
    params.require(:project).permit :name, :description
  end
end
