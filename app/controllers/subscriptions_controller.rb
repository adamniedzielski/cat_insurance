class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(insurance_params)
    @subscription.user = current_user
    @subscription.insurance_id = params.fetch(:insurance_id)
    @subscription.save!
    redirect_to insurances_url, notice: "Signed up for insurance"
  end

  private

  def insurance_params
    params.require(:subscription).permit(:starts_on)
  end
end
