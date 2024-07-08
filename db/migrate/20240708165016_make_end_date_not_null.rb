# frozen_string_literal: true

class MakeEndDateNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :subscriptions, :end_date, false
  end
end
