class ChargesController < ApplicationController

  def new
  end

  def create
  Stripe.api_key = Rails.configuration.stripe[:secret_key]


  token = params[:stripeToken]


  begin
    charge = Stripe::Charge.create(
      :amount => 500, # amount in cents, again
      :currency => "usd",
      :card => token,
      :description => "payinguser@example.com"
    )
  rescue Stripe::CardError => e
    # The card has been declined
  end
end

end
