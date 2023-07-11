require 'rails_helper'

RSpec.describe "Delete Company", type: :feature do
  describe "user story 19 - delete button" do
    before :each do
      @company = Company.create!(name: "Frank and Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      @company2 = Company.create(name: "Squeeze", federal_ein: 124365879, non_profit: true, address_line_1: "875 Albioni St", address_line_2: "apt i", city: "Denver", state: "CO", zipcode: "80220")
      @manila = Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000, company_id: @company.id)
      @latrice = Employee.create!(first_name: "Latrice", last_name: "Royale", i9_eligible: true, benefits_eligible: false, salary: 95000, company_id: @company.id)
      @jimbo = Employee.create!(first_name: "Jimbo", last_name: "Clown", i9_eligible: true, benefits_eligible: false, salary: 87340, company_id: @company2.id)

      visit "/companies/#{@company.id}"
    end

    it "has a button to delete the company" do
      expect(page).to have_button("Delete Company")
    end

    # I click the link "Delete Company"
    # Then a 'DELETE' request is sent to '/companies/:id',
    # the company is deleted, and all related employee records are deleted
    # and I am redirected to the company index page where I no longer see this company
    it "when clicked, removes the company and redirects to the company index page" do
      expect(page).to have_content(@company.name)
      click_button("Delete Company")
      expect(current_path).to eq("/companies")
      expect(page).to_not have_content(@company.name)
    end

    it "when clicked, removes the company's employees too" do
      expect(page).to have_content(@company.name)
      
      click_button("Delete Company")
      visit "/employees"
      expect(page).to_not have_content(@manila.name)
      expect(page).to_not have_content(@latrice.name)
      expect(page).to have_content(@jimbo.name) #works for different company
    end
  end
end