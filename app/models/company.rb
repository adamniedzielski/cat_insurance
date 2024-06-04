# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :insurances, dependent: :destroy
  has_one_attached :logo
end
