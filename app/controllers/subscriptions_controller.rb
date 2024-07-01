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

    if @subscription.save
      SubscribeJob.perform_async(@subscription.id)
      redirect_to insurances_url, notice: t("subscriptions.created")
    else
      render "insurances/show"
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:starts_on, :discount_code_value)
  end
end
