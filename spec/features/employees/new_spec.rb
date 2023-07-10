require 'rails_helper'

RSpec.describe "'employee/new' page", type: :feature do
  before :each do
    @company = Company.create!(name: "Frank and Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
  end

  describe 'When I am taken to employees/new' do
    it 'has a form with fields for all the employee attributes' do
      visit "/companies/#{@company.id}/employees/new"

      expect(page).to have_content('First Name')
      expect(page).to have_content('Last Name')
      expect(page).to have_content('i9 Eligible?')
      expect(page).to have_content('Benefits Eligible?')
      expect(page).to have_content('Salary')
    end

    describe 'When I fill in the form and click Save Employee' do
      it 'redirects to companies/:id/employees and has the new employee' do
        visit "/companies/#{@company.id}/employees/new"

        within("#new_employee") do
          fill_in :first_name, with: 'Trinity'
          fill_in :last_name, with: 'The Tuck'
          select 'True', from: :i9_eligible
          select 'False', from: :benefits_eligible
          fill_in :salary, with: 85000
        end
        click_button('Save Employee') # submits the form

        expect(page.current_path).to eq("/companies/#{@company.id}/employees")
        expect(page).to have_content("Trinity The Tuck")
        expect(page).to have_content("i-9 Eligible? True")
        expect(page).to have_content("Benefits Eligible? False")
        expect(page).to have_content("Salary: 85000")
      end
    end
  end
end