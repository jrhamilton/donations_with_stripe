class ChargesController < ApplicationController

  def new
  end

  def create
    Stripe.api_key = Rails.configuration.stripe[:secret_key]

    token = params[:stripeToken]
    amount = params[:amount].to_f
    amount = amount * 100
    amount = amount.to_i

    begin
      charge = Stripe::Charge.create(
        :amount => amount, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "payinguser@example.com"
      )
      @amount = charge.amount.to_f / 100
    rescue Stripe::CardError => e
    # The card has been declined
    end
  end

end
