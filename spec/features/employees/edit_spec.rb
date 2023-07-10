require 'rails_helper'

RSpec.describe "'/employees/:id/edit' page", type: :feature do
  describe 'After clicking the "Edit Employee" link' do
    before :each do
      @company = Company.create(name: "Squeeze", federal_ein: 127583920, non_profit: true, address_line_1: "895 Albioni St", address_line_2: "Unit 3", city: "Denver", state: "CO", zipcode: "80220")
      @manila = Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000, company_id: @company.id)

      visit "/employees/#{@manila.id}/edit"
    end

    describe "I am taken to '/employees/:id/edit'" do
      it "has a form to edit the employees's attributes" do
        expect(page).to have_content('First Name')
        expect(page).to have_content('Last Name')
        expect(page).to have_content('i9 Eligible?')
        expect(page).to have_content('Benefits Eligible?')
        expect(page).to have_content('Salary')
      end
      
      
      # When I click the button to submit the form "Update Child"
      # Then a `PATCH` request is sent to '/child_table_name/:id',
      # the child's data is updated,
      # and I am redirected to the Child Show page where I see the Child's updated information'
      it "saves the edited employee info and redirects to the employeees/:id page" do
        within("#edit_employee") do
          fill_in :first_name, with: 'Monet'
          fill_in :last_name, with: 'Exchange'
          select 'True', from: :benefits_eligible
        end
        click_button('Save Employee') # submits the form
  
        expect(page.current_path).to eq("/employees/#{@manila.id}")
        expect(page).to have_content("Monet Exchange")
        expect(page).to have_content("Benefits Eligible? True")
      end
    end
  end
end