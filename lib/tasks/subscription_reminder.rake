# frozen_string_literal: true

namespace :subscription_reminder do
  task end_date_reminder: :environment do
    Subscription.where(end_date: 3.months.from_now).find_each do |subscription|
      SubscriptionMailer.with(user: subscription.user).ending_subscription.deliver_now
    end
  end
end
