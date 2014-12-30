class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @project = Project.find_by(user_id: @user.id)
    @investments = @user.investments
  end
end
