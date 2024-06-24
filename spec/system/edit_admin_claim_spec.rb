# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Edit claim status", system: true do
  let!(:user) { User.create!(email: "test@gmail.com", password: "123456", is_admin: true) }
  before do
    login_as user, scope: :user
  end
  let!(:company) { Company.create!(name: "Test Company") }
  let!(:insurance) { Insurance.create!(name: "Test Insurance", price_cents: 100_00, company:) }
  let!(:subscription) { Subscription.create!(user:, insurance:, starts_on: Time.zone.today) }
  let!(:claim) { Claim.create!(subscription:, status: "new") }

  it "displays success message after updating claim status" do
    visit edit_admin_claim_path(claim)

    select "processing", from: "Status"
    click_on "Update Claim"

    expect(page).to have_content("Claim status updated successfully.")
    expect(page).to have_content("processing")
  end
end
