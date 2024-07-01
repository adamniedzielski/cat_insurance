# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :insurance
  belongs_to :discount_code, optional: true
  has_many :claims, dependent: :destroy

  attr_accessor :discount_code_value

  validates :starts_on, presence: true
  validate :starts_on_cannot_be_in_the_past
  validate :validate_discount_code, if: -> { discount_code_value.present? }
  validates :insurance_id, uniqueness: {
    scope: :user_id
  }

  after_validation :set_discount_code

  private

  def starts_on_cannot_be_in_the_past
    return unless starts_on.present? && starts_on < Time.zone.today

    errors.add(:starts_on, "can't be in the past")
  end

  def validate_discount_code
    discount = DiscountCode.find_by(code: discount_code_value, insurance_id:)
    return if discount

    errors.add(:discount_code, "is not valid for this insurance")
  end

  def set_discount_code
    discount = DiscountCode.find_by(code: discount_code_value, insurance_id:)
    self.discount_code_id = discount&.id
  end
end
