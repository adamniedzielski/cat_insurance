# frozen_string_literal: true

class PaymentsController < ApplicationController
  def validate_payment
    Stripe.api_key = ENV.fetch("STRIPE_API_KEY")
    session = Stripe::Checkout::Session.retrieve(params[:session_id])

    @subscription = Subscription.find_by(stripe_session_id: session.id)

    if @subscription && session.payment_status == "paid"
      @subscription.update(paid: true)
      redirect_to payments_success_path(subscription_id: @subscription.id)
    else
      redirect_to payments_error_path
    end
  end

  def success
    @subscription = Subscription.find(params[:subscription_id])
  end
end
