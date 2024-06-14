# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :insurance

  validates :starts_on, presence: true
  validate :starts_on_cannot_be_in_the_past
  validate :unique_subscription

  private

  def starts_on_cannot_be_in_the_past
    return unless starts_on.present? && starts_on < Time.zone.today

    errors.add(:starts_on, "can't be in the past")
  end

  def unique_subscription
    return unless Subscription.exists?(user_id:, insurance_id:)

    errors.add(:base, "You are already subscribed to this insurance")
  end
end
