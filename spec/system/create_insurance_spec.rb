# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create insurance", system: true do
  it "displays success message" do
    visit new_admin_insurance_path
    fill_in "Name", with: "My test insurance"
    fill_in "Price cents", with: 100_00
    click_on "Create Insurance"

    expect(page).to have_content("Insurance was successfully created.")
  end
end
