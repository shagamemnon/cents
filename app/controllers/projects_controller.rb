class ProjectsController < ApplicationController
  def index
    @charity_projects = Project.all
  end

  def show
    @user_project = Project.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
