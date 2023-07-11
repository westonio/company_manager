require 'rails_helper'

RSpec.describe "Deleting an employee", type: :feature do
  before :each do
    @company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
    @manila = Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000, company_id: @company.id)
    @latrice = Employee.create!(first_name: "Latrice", last_name: "Royale", i9_eligible: true, benefits_eligible: false, salary: 95000, company_id: @company.id)
    @jimbo = Employee.create!(first_name: "Jimbo", last_name: "Clown", i9_eligible: true, benefits_eligible: false, salary: 87340, company_id: @company.id)
    visit "/employees/#{@manila.id}"
  end

  describe 'User story 20 - has a link to delete employee, deletes the record, and redirects' do
    it 'has a button to delete the employee' do
      expect(page).to have_button('Delete Employee')
    end

    # When I click the link
    # Then a 'DELETE' request is sent to '/child_table_name/:id',
    # the child is deleted,
    # and I am redirected to the child index page where I no longer see this child
    it "deletes the employee when I click the button, and redirects to the Employees index page" do
      expect(page).to have_content(@manila.name)
      
      click_button("Delete Employee")

      expect(current_path).to eq("/employees")
      expect(page).to_not have_content(@manila.name)
      expect(page).to have_content(@latrice.name)
      expect(page).to have_content(@jimbo.name)
    end
  end
end