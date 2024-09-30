# frozen_string_literal: true

class ScheduledAppointment < ApplicationRecord
  belongs_to :user
  belongs_to :vet
end
