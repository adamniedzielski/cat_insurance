# frozen_string_literal: true

class Insurance < ApplicationRecord
    has_many :subscriptions
end
