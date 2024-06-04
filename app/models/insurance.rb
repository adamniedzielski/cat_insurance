# frozen_string_literal: true

class Insurance < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  belongs_to :company, optional: true

  validates :name, presence: true, uniqueness: true
  validates :price_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
