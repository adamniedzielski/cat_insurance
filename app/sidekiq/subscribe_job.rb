# frozen_string_literal: true

class SubscribeJob
  include Sidekiq::Job

  def perform(subscription_id); end
end
