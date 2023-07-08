require 'rails_helper'

RSpec.describe 'Company Show Page', type: :feature do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  describe "When I visit '/parents/:id'" do
    before :each do
      @company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      @company2 = Company.create!(name: "Squeeze", federal_ein: 124365879, non_profit: true, address_line_1: "875 Albioni St", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      @manila = Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000, company_id: @company.id)
      @latrice = Employee.create!(first_name: "Latrice", last_name: "Royale", i9_eligible: true, benefits_eligible: false, salary: 95000, company_id: @company.id)
      @jimbo = Employee.create!(first_name: "Jimbo", last_name: "Clown", i9_eligible: true, benefits_eligible: false, salary: 87340, company_id: @company2.id)

      visit "/companies/#{@company.id}"
    end

    it 'displays the company name' do
      expect(page).to have_content(@company.name)
      expect(page).to_not have_content(@company2.name)
    end

    it 'displays the company FEIN' do
      expect(page).to have_content(@company.federal_ein)
      expect(page).to_not have_content(@company2.federal_ein)
    end

    it 'displays if company is non profit (boolean)' do
      expect(page).to have_content(@company.non_profit)
      expect(page).to_not have_content(@company2.non_profit)
    end

    it 'displays the company address' do
      expect(page).to have_content(@company.address_line_1)
      expect(page).to have_content(@company.address_line_2)
      expect(page).to have_content(@company.city)
      expect(page).to have_content(@company.state)
      expect(page).to have_content(@company.zipcode)
    end

    # When I visit a parent's show page
    # I see a count of the number of children associated with this parent
    it "I see a count of the number of employees associated with this company" do
      expect(page).to have_content("Employee Count: #{@company.employee_count}")
    end
    
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    describe "When I visit any page on the site" do
      it "see a link at the top of the page that takes me to the Employees Index" do
        expect(page).to  have_link('All Employees', href: "/employees")
      end
    end
  end
end