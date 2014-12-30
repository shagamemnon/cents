class InvestmentsController < ApplicationController
  def new
    @investment = Investment.new
  end

  def create
    @project = Project.find(params[:project_id])
    amount = investment_params[:amount].to_f/100
    @investment = @project.investments.new(amount: amount)
    @investment.duration = 5
    @investment.save!
    binding.pry
    redirect_to user_path(@project.user_id)
  end

  private

  def investment_params
    params.require(:investment).permit(:amount, :duration)
  end
end
