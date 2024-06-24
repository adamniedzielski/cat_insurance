# frozen_string_literal: true

class Claim < ApplicationRecord
  belongs_to :subscription

  STATUSES = %w[new processing resolved rejected].freeze

  validates :status, inclusion: { in: STATUSES }

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= :new
  end
end
