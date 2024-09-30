# frozen_string_literal: true

class CreateScheduledAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :scheduled_appointments do |t|
      t.datetime :date

      t.references :user, null: false, foreign_key: true
      t.references :vet, null: false, foreign_key: true
      t.timestamps
    end
  end
end
