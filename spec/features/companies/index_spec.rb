require 'rails_helper'

RSpec.describe 'Companies Index', type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  describe "When I visit '/companies'" do
    it 'displays the name of each company' do
      company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      company2 = Company.create(name: "Squeeze", federal_ein: 124365879, non_profit: true, address_line_1: "875 Albioni St", address_line_2: "apt i", city: "Denver", state: "CO", zipcode: "80220")
      visit "/companies"

      expect(page).to have_content(company.name)
      expect(page).to have_content(company2.name)
    end
  end
end