# frozen_string_literal: true

class CreateClaims < ActiveRecord::Migration[7.1]
  def change
    create_table :claims do |t|
      t.text :reason
      t.integer :price_cents
      t.references :subscription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
