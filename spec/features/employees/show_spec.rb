require 'rails_helper'

RSpec.describe 'Employee Show Page', type: :feature do
# User Story 4, Child Show 
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)
  describe "When I visit '/child_table_name/:id'" do
    before :each do
      @company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      @manila = Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000, company_id: @company.id)
      # @latrice = Employee.create!(first_name: "Latrice", last_name: "Royale", i9_eligible: true, benefits_eligible: false, salary: 95000, company_id: @company.id)
      # @jimbo = Employee.create!(first_name: "Jimbo", last_name: "Clown", i9_eligible: true, benefits_eligible: false, salary: 87340, company_id: @company2.id)
      visit "/employees/#{@manila.id}"
    end

    describe 'see the employee with that id including the employees attributes' do
      it 'shows employees name' do
        expect(page).to have_content(@manila.name)
      end

      it 'shows employees i9_eligibility (boolean)' do
        expect(page).to have_content(@manila.i9_eligible.to_s.capitalize)
      end

      it 'shows employees benefits eligibility (boolean)' do
        expect(page).to have_content(@manila.benefits_eligible.to_s.capitalize)
      end

      it 'shows employees salary' do
        expect(page).to have_content(@manila.salary)
      end
      
      it 'shows employees company id' do
        expect(page).to have_content(@manila.company_id)
      end
    end

    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    describe "When I visit any page on the site" do
      it "see a link at the top of the page that takes me to the Employees Index" do
        expect(page).to  have_link('All Employees', href: "/employees")
      end

      it "has a link at the top of the page that takes me to the Parent Index" do
        expect(page).to  have_link('All Companies', href: "/companies")
      end
    end

    describe "I see a link to update that Employee 'Update Employee'" do
      it 'has a link to Update Employee (Edit)' do
        expect(page).to  have_button('Edit Employee')
      end
    end

    describe 'User story 20 - has a link to delete the employee "Delete employee"' do
      it 'has a button to delete the employee' do
        expect(page).to have_button('Delete Employee')
      end
    end
  end
end