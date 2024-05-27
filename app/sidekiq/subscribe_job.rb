# frozen_string_literal: true

class SubscribeJob
  include Sidekiq::Job

  def perform(subscription_id)
    subscription = Subscription.find(subscription_id)
    user = subscription.user
    SubscriptionMailer.with(user:).success_subscription.deliver_now
  end
end
