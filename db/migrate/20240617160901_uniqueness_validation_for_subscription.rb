class UniquenessValidationForSubscription < ActiveRecord::Migration[7.1]
  def change
    add_index :subscriptions, [:user_id, :insurance_id], unique: true
  end
end
