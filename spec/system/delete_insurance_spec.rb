# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Delete insurance", system: true do
  let!(:company) { Company.create!(name: "Test Company") }
  let!(:insurance) { Insurance.create!(name: "test insurance", price_cents: 1234, company:) }
  let!(:user) { User.create!(email: "test@gmail.com", password: "123456", is_admin: true) }
  before do
    login_as user, scope: :user
  end

  it "displays success message" do
    visit admin_insurances_path
    click_on "Delete"

    expect(page).to have_content("Insurance was successfully deleted.")
  end
end
