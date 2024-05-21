# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Delete insurance", system: true do
  it "displays success message" do
    Insurance.create!(name: "test insurance", price_cents: 1234)

    visit admin_insurances_path
    click_on "Delete"

    expect(page).to have_content("Insurance was successfully deleted.")
  end
end
