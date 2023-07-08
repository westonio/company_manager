require 'rails_helper'

RSpec.describe "New Company Page '/companies/new'", type: :feature do
  it 'has a form with field for each Company attribute' do
    visit '/companies/new'

    expect(page).to have_content('Name')
    expect(page).to have_content('Federal EIN')
    expect(page).to have_content('Non Profit?')
    expect(page).to have_content('Address Line 1')
    expect(page).to have_content('Address Line 2')
    expect(page).to have_content('City')
    expect(page).to have_content('State')
    expect(page).to have_content('Zip Code')
  end

  describe "When I fill out the form with a new parent's attributes, and I click the button Create Company button to submit the form" do
    context "sends a `POST` request to the '/company' route and creates a new record" do
      it "redirects to the Company Index page where I see the new Company displayed" do
        visit '/companies/new'
        within("#new_company") do
          fill_in 'company[name]', with: 'Trader Joes'
          fill_in 'company[federal_ein]', with: 126983749
          select 'False', from: 'company[non_profit]'
          fill_in 'company[address_line_1]', with: "800 8th Street"
          fill_in 'company[address_line_2]', with: ""
          fill_in 'company[city]', with: "Denver"
          fill_in 'company[state]', with: "CO"
          fill_in 'company[zipcode]', with: "80220"
        end
        click_button('Save Company') # submits the form

        expect(page.current_path).to eq("/companies")
        expect(page).to have_content("Trader Joes")
      end
    end
  end
end