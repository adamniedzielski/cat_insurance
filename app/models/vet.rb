# frozen_string_literal: true

class Vet < ApplicationRecord
  has_many :users, dependent: :destroy
  belongs_to :insurance
end
