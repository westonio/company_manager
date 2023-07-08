# Employees Spec
require 'rails_helper'

RSpec.describe "Employees Index Page", type: :feature do
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)
  describe "When I visit '/employees'" do
    before :each do
      @company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      @company2 = Company.create(name: "Squeeze", federal_ein: 124365879, non_profit: true, address_line_1: "875 Albioni St", address_line_2: "apt i", city: "Denver", state: "CO", zipcode: "80220")
      @manila = Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000, company_id: @company.id)
      @latrice = Employee.create!(first_name: "Latrice", last_name: "Royale", i9_eligible: true, benefits_eligible: false, salary: 95000, company_id: @company.id)
      @jimbo = Employee.create!(first_name: "Jimbo", last_name: "Clown", i9_eligible: true, benefits_eligible: false, salary: 87340, company_id: @company2.id)

      visit "/employees"
    end

    describe "I see each Employee in the system including the Employee's attributes" do
      it 'shows employees name' do
        expect(page).to have_content(@manila.name)
        expect(page).to have_content(@latrice.name)
        expect(page).to have_content(@jimbo.name)
      end

      it 'shows employees i9_eligibility (boolean)' do
        expect(page).to have_content(@manila.i9_eligible)
        expect(page).to have_content(@latrice.i9_eligible)
        expect(page).to have_content(@jimbo.i9_eligible)
      end

      it 'shows employees benefits eligibility (boolean)' do
        expect(page).to have_content(@manila.benefits_eligible)
        expect(page).to have_content(@latrice.benefits_eligible)
        expect(page).to have_content(@jimbo.benefits_eligible)
      end

      it 'shows employees salary' do
        expect(page).to have_content(@manila.salary)
        expect(page).to have_content(@latrice.salary)
        expect(page).to have_content(@jimbo.salary)
      end

      it 'shows the employees company id' do
        expect(page).to have_content(@manila.company_id)
        expect(page).to have_content(@latrice.company_id)
        expect(page).to have_content(@jimbo.company_id)
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
  end
end