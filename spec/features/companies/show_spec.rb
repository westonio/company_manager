require 'rails_helper'

RSpec.describe Company, type: :feature do
  describe 'Show page' do
    it 'displays the company name' do
      company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      company2 = Company.create!(name: "Squeeze", federal_ein: 124365879, non_profit: true, address_line_1: "875 Albioni St", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      visit "/companies/#{company.id}"

      expect(page).to have_content(company.name)
      expect(page).to_not have_content(company2.name)
    end

    it 'displays the company FEIN' do
      company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      company2 = Company.create!(name: "Squeeze", federal_ein: 124365879, non_profit: true, address_line_1: "875 Albioni St", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      visit "/companies/#{company.id}"

      expect(page).to have_content(company.federal_ein)
      expect(page).to_not have_content(company2.federal_ein)
    end

    it 'displays if company is non profit (boolean)' do
      company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      company2 = Company.create!(name: "Squeeze", federal_ein: 124365879, non_profit: true, address_line_1: "875 Albioni St", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      visit "/companies/#{company.id}"

      expect(page).to have_content(company.non_profit)
      expect(page).to_not have_content(company2.non_profit)
    end

    it 'displays the company address' do
      company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      visit "/companies/#{company.id}"

      expect(page).to have_content(company.address_line_1)
      expect(page).to have_content(company.address_line_2)
      expect(page).to have_content(company.city)
      expect(page).to have_content(company.state)
      expect(page).to have_content(company.zipcode)
    end
  end
end