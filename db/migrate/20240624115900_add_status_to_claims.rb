# frozen_string_literal: true

class AddStatusToClaims < ActiveRecord::Migration[7.1]
  def change
    add_column :claims, :status, :string, default: "new", null: false
  end
end
