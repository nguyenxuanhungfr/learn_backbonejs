class ProjectsController < ApplicationController

  def index
    respond_to do |format|
      msg = Project.all
      format.json  { render :json => msg }
    end
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
    @project = Project.find(params[:id])
    render :json => @project
  end

  def update
    project = Project.find(params[:id])
    project.update_attributes project_params
    render :json => project
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    render :json => project
  end

  private

  def project_params
    params.require(:project).permit :name, :description
  end
end
