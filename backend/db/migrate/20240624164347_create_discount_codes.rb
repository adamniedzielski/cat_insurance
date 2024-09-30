# frozen_string_literal: true

class CreateDiscountCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :discount_codes do |t|
      t.integer :discount_percentage
      t.string :code
      t.references :insurance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
