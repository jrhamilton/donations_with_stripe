class SubscriptionsController < ApplicationController

  def new
  end

  def create
    Stripe.api_key = Rails.configuration.stripe[:secret_key]

    token = params[:stripeToken]

    begin
      customer = Stripe::Customer.create(
        :card => token,
        :plan => "bronze",
        :email => "payinguser@example.com"
      )
      #@plan = customer.plan
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end
end
