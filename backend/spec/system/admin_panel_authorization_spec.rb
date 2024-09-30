# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Create insurance", system: true do
  let!(:company) { Company.create!(name: "Test Company") }

  it "redirect not admin user to the login page" do
    user = User.create!(email: "test@gmail.com", password: "123456", is_admin: false)
    login_as user, scope: :user
    visit new_admin_insurance_path

    expect(page).to have_content("You don't have access to the admin panel")
  end

  it "does not redirect admin user to the login page" do
    user = User.create!(email: "test@gmail.com", password: "123456", is_admin: true)
    login_as user, scope: :user
    visit new_admin_insurance_path

    expect(page).to have_content("New Insurance")
  end
end
