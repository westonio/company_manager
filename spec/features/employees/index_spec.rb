# Employees Spec
require 'rails_helper'

RSpec.describe "Employees Index Page", type: :feature do
  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)
  describe "When I visit '/employees'" do
    describe "I see each Employee in the system including the Employee's attributes" do
      before :each do
        @manila = Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000)
        @latrice = Employee.create!(first_name: "Latrice", last_name: "Royale", i9_eligible: true, benefits_eligible: false, salary: 95000)
        @jimbo = Employee.create!(first_name: "Jimbo", last_name: "Clown", i9_eligible: true, benefits_eligible: false, salary: 87340)
      end

      it 'shows employees name' do
        visit "/employees"

        expect(page).to have_content(@manila.name)
        expect(page).to have_content(@latrice.name)
        expect(page).to have_content(@jimbo.name)
      end

      it 'shows employees i9_eligibility (boolean)' do

      end

      it 'shows employees benefits eligibility (boolean)' do

      end

      it 'shows employees salary' do

      end
    end
  end
end