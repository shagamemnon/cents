class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save_with_payment
      redirect_to user_path(session[:user_id])
    else
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:stripe_card_token)
  end
end
