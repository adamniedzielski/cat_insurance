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

  it "displays error when name is not provided" do
    visit new_admin_insurance_path
    fill_in "Price cents", with: 100_00
    click_on "Create Insurance"

    expect(page).to have_content("Name can't be blank")
  end

  it "displays error when name is not unique" do
    Insurance.create!(name: "Unique Insurance", price_cents: 1234)
    visit new_admin_insurance_path
    fill_in "Name", with: "Unique Insurance"
    fill_in "Price cents", with: 100_00
    click_on "Create Insurance"

    expect(page).to have_content("Name has already been taken")
  end

  it "displays error when price is not provided" do
    visit new_admin_insurance_path
    fill_in "Name", with: "My test insurance"
    click_on "Create Insurance"

    expect(page).to have_content("Price cents can't be blank")
  end

  it "displays error when price cents is not a number" do
    visit new_admin_insurance_path
    fill_in "Name", with: "My test insurance"
    fill_in "Price cents", with: "abc"
    click_on "Create Insurance"

    expect(page).to have_content("Price cents is not a number")
  end

  it "displays error when price cents is negative" do
    visit new_admin_insurance_path
    fill_in "Name", with: "My test insurance"
    fill_in "Price cents", with: -100
    click_on "Create Insurance"

    expect(page).to have_content("Price cents must be greater than or equal to 0")
  end
end
