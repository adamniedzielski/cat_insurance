# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def create
    @insurance = Insurance.find(params[:insurance_id])
    @subscription = @insurance.subscriptions.new(insurance_params)
    @subscription.user = current_user

    if @subscription.save
      redirect_to insurances_url, notice: t("subscriptions.created")
    else
      render 'insurances/show'
    end
  end

  private

  def insurance_params
    params.require(:subscription).permit(:starts_on)
  end
end
