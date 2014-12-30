class WelcomeController < ApplicationController
  def index
    @projects = Project.where.not('charity_id' => nil)
  end

  def how_it_works

  end
end
