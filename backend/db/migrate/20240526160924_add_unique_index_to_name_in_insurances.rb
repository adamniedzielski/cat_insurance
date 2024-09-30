# frozen_string_literal: true

class AddUniqueIndexToNameInInsurances < ActiveRecord::Migration[7.1]
  def change
    add_index :insurances, :name, unique: true
  end
end
