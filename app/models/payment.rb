class Payment < ActiveRecord::Base
attr_accessor :stripe_card_token

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logged.error 'Stripe error while creating customer: #{e.message}'
    errors.add :base, 'There was a problem with you credit card.'
    false
  end

end
