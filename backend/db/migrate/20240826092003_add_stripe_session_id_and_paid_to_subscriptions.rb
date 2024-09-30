# frozen_string_literal: true

class AddStripeSessionIdAndPaidToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    change_table :subscriptions, bulk: true do |t|
      t.string :stripe_session_id
      t.boolean :paid, default: false, null: false
    end
  end
end
