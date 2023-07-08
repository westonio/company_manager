require 'rails_helper'

RSpec.describe 'Company Show Page', type: :feature do
  # As a visitor
  # When I visit '/parents/:id'
  describe "When I visit '/parents/:id'" do
    before :each do
      @company = Company.create!(name: "Frank and Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
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

    it "I see a count of the number of employees associated with this company" do
      expect(page).to have_content("Employee Count: #{@company.employee_count}")
    end

    it "has a link to take me to that parent's `child_table_name` page ('/companies/:id/employees')" do
      expect(page).to  have_link("All Employees", href: "/companies/#{@company.id}/employees")
    end

    describe "When I visit any page on the site" do
      it "see a link at the top of the page that takes me to the Employees Index" do
        expect(page).to  have_link('All Employees', href: "/employees")
      end

      it "has a link at the top of the page that takes me to the Parent Index" do
        expect(page).to  have_link('All Companies', href: "/companies")
      end
    end

    it "has a link to update the company 'Update Company'" do
      expect(page).to  have_link('Update Company', href: "/companies/#{@company.id}/edit")
    end

    it "when clicked, redirects to '/companies/:id/edit'" do
      click_link("Update Company")
      expect(page).to have_current_path("/companies/#{@company.id}/edit")
    end
  end
end