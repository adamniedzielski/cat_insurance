# frozen_string_literal: true

class Prescription < ApplicationRecord
  belongs_to :user
  belongs_to :vet

  validates :medicine_name, presence: true
end
