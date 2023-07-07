require 'rails_helper'

RSpec.describe 'Employee Show Page', type: :feature do
# User Story 4, Child Show 
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)
  describe "When I visit '/child_table_name/:id'" do
    describe 'see the employee with that id including the employees attributes' do
      before :each do
        @company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
        @manila = Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000, company_id: @company.id)
        # @latrice = Employee.create!(first_name: "Latrice", last_name: "Royale", i9_eligible: true, benefits_eligible: false, salary: 95000, company_id: @company.id)
        # @jimbo = Employee.create!(first_name: "Jimbo", last_name: "Clown", i9_eligible: true, benefits_eligible: false, salary: 87340, company_id: @company2.id)
        visit "/employees/#{@manila.id}"
      end

      it 'shows employees name' do
        expect(page).to have_content(@manila.name)
      end

      it 'shows employees i9_eligibility (boolean)' do
        expect(page).to have_content(@manila.i9_eligible)
      end

      it 'shows employees benefits eligibility (boolean)' do
        expect(page).to have_content(@manila.benefits_eligible)
      end

      it 'shows employees salary' do
        expect(page).to have_content(@manila.salary)
      end
      
      it 'shows employees company id' do
        expect(page).to have_content(@manila.company_id)
      end
    end
  end
end