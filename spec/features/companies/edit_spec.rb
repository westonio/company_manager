require 'rails_helper'

RSpec.describe "Update Company page '/companies/:id/update'", type: :feature do
  before :each do
    @company = Company.create!(name: "Frank and Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
    visit "/companies/#{@company.id}/edit"
  end
  describe "I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attribute" do
    it 'has Company attributes' do
    expect(page).to have_content('Name')
    expect(page).to have_content('Federal EIN')
    expect(page).to have_content('Non Profit?')
    expect(page).to have_content('Address Line 1')
    expect(page).to have_content('Address Line 2')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Zip Code')
    end
  end

  describe "When I fill out the form with updated information" do
  # And I click the button to submit the form
  # Then a `PATCH` request is sent to '/parents/:id',
  # the parent's info is updated,
  # and I am redirected to the Parent's Show page where I see the parent's updated info
    it "should update and redirect" do
      within("#edit_company") do
        fill_in :name, with: 'Roze and Frank'
        select 'True', from: :non_profit
      end
      click_button('Save Company') # submits the form

      expect(page.current_path).to eq("/companies/#{@company.id}")
      expect(page).to have_content("Roze and Frank")
      expect(page).to have_content("Non-Profit? True")
    end
  end
end