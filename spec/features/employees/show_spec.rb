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
        @manila = Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000)
        @latrice = Employee.create!(first_name: "Latrice", last_name: "Royale", i9_eligible: true, benefits_eligible: false, salary: 95000)
        @jimbo = Employee.create!(first_name: "Jimbo", last_name: "Clown", i9_eligible: true, benefits_eligible: false, salary: 87340)
      end

      it 'shows employees name' do
        visit "/employees/#{@manila.id}"

        expect(page).to have_content(@manila.name)
      end

      it 'shows employees i9_eligibility (boolean)' do
        visit "/employees/#{@manila.id}"

        expect(page).to have_content(@manila.i9_eligible)
      end

      it 'shows employees benefits eligibility (boolean)' do
        visit "/employees/#{@manila.id}"

        expect(page).to have_content(@manila.benefits_eligible)
      end

      it 'shows employees salary' do
        visit "/employees/#{@manila.id}"

        expect(page).to have_content(@manila.salary)
        save_and_open_page
      end
    end
  end
end