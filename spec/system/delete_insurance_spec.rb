# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Delete insurance", system: true do
  let!(:company) { Company.create!(name: "Test Company") }
  let!(:insurance) { Insurance.create!(name: "test insurance", price_cents: 1234, company:) }

  it "displays success message" do
    visit admin_insurances_path
    click_on "Delete", match: :first

    expect(page).to have_content("Insurance was successfully deleted.")
  end
end
