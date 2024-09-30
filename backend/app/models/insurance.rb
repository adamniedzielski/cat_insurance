# frozen_string_literal: true

class Insurance < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :discount_codes, dependent: :destroy
  has_many :vets, dependent: :destroy
  belongs_to :company

  validates :name, presence: true, uniqueness: true
  validates :price_cents, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
