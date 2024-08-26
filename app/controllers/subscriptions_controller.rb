# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @subscriptions = @user.subscriptions.includes(:insurance)
  end

  def create
    @insurance = Insurance.find(params[:insurance_id])

    @subscription = @insurance.subscriptions.new(subscription_params)

    @subscription.user = current_user
    assign_end_date

    @subscription.paid = false
    if @subscription.save
      SubscribeJob.perform_async(@subscription.id)
      redirect_to_payment(@insurance)
    else
      render "insurances/show"
    end
  end

  private

  def redirect_to_payment(insurance)
    Stripe.api_key = ENV.fetch("STRIPE_API_KEY")
    session = Stripe::Checkout::Session.create({
                                                 line_items: [{
                                                   price_data: {
                                                     currency: "eur",
                                                     product_data: {
                                                       name: insurance.name
                                                     },
                                                     unit_amount: calc_price(insurance)
                                                   },
                                                   quantity: 1
                                                 }],
                                                 mode: "payment",
                                                 success_url: "http://localhost:3000/payments/validate_payment?session_id={CHECKOUT_SESSION_ID}",
                                                 cancel_url: "http://localhost:3000/payments/error"
                                               })

    @subscription.update(stripe_session_id: session.id)

    redirect_to session.url, status: :see_other, allow_other_host: true
  end

  def subscription_params
    params.require(:subscription).permit(:starts_on, :discount_code_value)
  end

  def assign_end_date
    @subscription.end_date = @subscription.starts_on + 1.year if @subscription.starts_on.present?
  end

  def calc_price(insurance)
    if @subscription.discount_code_id
      insurance.price_cents - ((insurance.price_cents * @subscription.discount_code.discount_percentage) / 100)
    else
      insurance.price_cents
    end
  end
end
