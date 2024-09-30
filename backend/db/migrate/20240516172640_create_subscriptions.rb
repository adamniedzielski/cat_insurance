# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :insurance, null: false, foreign_key: true
      t.datetime :starts_on, null: false

      t.timestamps
    end
  end
end
