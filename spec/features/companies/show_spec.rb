require 'rails_helper'

RSpec.describe Company, type: :feature do
  describe 'Show page' do
    it 'displays the company name' do
      company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      company2 = Company.create!(name: "Squeeze", federal_ein: 124365879, non_profit: false, address_line_1: "875 Albioni St", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      visit "/companies/#{company.id}"

      expect(page).to have_content(company.name)
      expect(page).to_not have_content(company2.name)
    end

    it 'displays the company FEIN' do
      
    end

    it 'displays if company is non profit (boolean)' do
      
    end

    it 'displays the company address' do
      
    end
  end
end