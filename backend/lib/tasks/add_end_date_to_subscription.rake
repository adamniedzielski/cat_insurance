# frozen_string_literal: true

namespace :add_end_date_column_to_subscription do
  task add_info: :environment do
    Subscription.find_each do |subscription|
      subscription.end_date = subscription.starts_on + 1.year
      subscription.save!
    end
  end
end
