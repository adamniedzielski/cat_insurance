# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :insurance

  validates :starts_on, presence: true
  validate :starts_on_cannot_be_in_the_past

  private

  def starts_on_cannot_be_in_the_past
    return unless starts_on.present? && starts_on < Time.zone.today

    errors.add(:starts_on, "can't be in the past")
  end
end
