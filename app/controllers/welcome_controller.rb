class WelcomeController < ApplicationController
  def index
    @projects = Project.where.not('charity_id' => nil)
    Project.progress_bar(@projects)
  end
end
