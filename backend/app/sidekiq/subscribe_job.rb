# frozen_string_literal: true

require "telegram/bot"

class SubscribeJob
  include Sidekiq::Job

  def perform(subscription_id)
    subscription = Subscription.find(subscription_id)
    user = subscription.user
    SubscriptionMailer.with(user:).success_subscription.deliver_now

    client = Telegram::Bot::Client.new(ENV.fetch("TELEGRAM_TOKEN"))
    client.api.send_message(
      chat_id: ENV.fetch("TELEGRAM_CHAT_ID"),
      text: "Subscribed to #{subscription.insurance.name}!"
    )
  end
end
