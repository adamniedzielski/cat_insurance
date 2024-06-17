# frozen_string_literal: true

class ClaimsController < ApplicationController
  def new
    @subscription = Subscription.find(params[:subscription_id])
    @claim = @subscription.claims.build
  end

  def create
    @subscription = Subscription.find(params[:subscription_id])
    @claim = @subscription.claims.build(claim_params)
    if @claim.save
      redirect_to subscriptions_path, notice: t("subscription.create_claim")
    else
      render :new
    end
  end

  private

  def claim_params
    params.require(:claim).permit(:reason, :price_cents)
  end
end
