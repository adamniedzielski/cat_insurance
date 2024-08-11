# frozen_string_literal: true

class CreateVets < ActiveRecord::Migration[7.1]
  def change
    create_table :vets do |t|
      t.datetime :scheduled_appointment
      t.string :name
      t.references :insurance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
