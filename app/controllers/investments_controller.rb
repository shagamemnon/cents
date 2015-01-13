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

    # Storing investment amount
    user_session[:amount] = amount
    user_session[:project_id] = @project.id
    user_session[:user_id] = @project.user.id

    Investment.first_investment(@project, amount)
    redirect_to new_payment_path
  end

  private

  def investment_params
    params.require(:investment).permit(:amount, :duration)
  end
end
