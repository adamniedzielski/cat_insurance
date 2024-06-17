# frozen_string_literal: true

class Claim < ApplicationRecord
  belongs_to :subscription
end
