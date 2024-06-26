# frozen_string_literal: true

class CreateInsurances < ActiveRecord::Migration[7.1]
  def change
    create_table :insurances do |t|
      t.string :name
      t.integer :price_cents

      t.timestamps
    end
  end
end
