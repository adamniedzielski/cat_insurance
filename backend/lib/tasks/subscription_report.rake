# frozen_string_literal: true

require "csv"

namespace :subscription_report do
  task generate: :environment do
    CSV.open("tmp/subscription_report.csv", "wb") do |csv|
      csv << Subscription.attribute_names
      Subscription.find_each do |subscription|
        csv << subscription.attributes.values
      end
    end
  end
end
