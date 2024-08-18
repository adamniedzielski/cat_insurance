# frozen_string_literal: true

class CreatePrescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :prescriptions do |t|
      t.string :medicine_name
      t.references :user, null: false, foreign_key: true
      t.references :vet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
