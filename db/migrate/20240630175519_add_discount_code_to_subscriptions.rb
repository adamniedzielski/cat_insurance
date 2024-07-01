# frozen_string_literal: true

class AddDiscountCodeToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_reference :subscriptions, :discount_code, index: true
    add_foreign_key :subscriptions, :discount_codes
  end
end
