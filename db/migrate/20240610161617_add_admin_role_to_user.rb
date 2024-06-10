# frozen_string_literal: true

class AddAdminRoleToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_admin, :boolean, default: false, null: false
  end
end
