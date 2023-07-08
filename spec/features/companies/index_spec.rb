require 'rails_helper'

RSpec.describe 'Companies Index', type: :feature do
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  describe "When I visit '/companies'" do
    before :each do
      @company1 = Company.create!(name: "Frank and Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      @company2 = Company.create(name: "Squeeze", federal_ein: 127583920, non_profit: true, address_line_1: "895 Albioni St", address_line_2: "Unit 3", city: "Denver", state: "CO", zipcode: "80220")
      @company3 = Company.create(name: "Pizzeria Locale", federal_ein: 126482619, non_profit: true, address_line_1: "875 Albioni St", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      visit "/companies"
    end

    it 'displays the name of each company' do
      expect(page).to have_content(@company1.name)
      expect(page).to have_content(@company2.name)
      expect(page).to have_content(@company3.name)
    end
    
    describe "I see that records are ordered by most recently created first" do
      it 'orders by most recently created' do
        #using orderly gem
        expect(@company3.name).to appear_before(@company2.name)
        expect(@company2.name).to appear_before(@company1.name)
      end
    
      it 'shows when company was created' do
        expect(page).to have_content(@company1.created_at)
        expect(page).to have_content(@company2.created_at)
        expect(page).to have_content(@company3.created_at)
      end
    end

    describe "When I visit any page on the site" do
      it "see a link at the top of the page that takes me to the Employees Index" do
        expect(page).to  have_link('All Employees', href: "/employees")
      end

      it "has a link at the top of the page that takes me to the Parent Index" do
        expect(page).to  have_link('All Companies', href: "/companies")
      end
    end

    describe "I see a link to create a new Company record" do
      describe "When I click this link Then I am taken to '/parents/new' where I  see a form for a new parent record" do
        it "has a link to '/companies/new" do
          expect(page).to  have_link('Add New Company', href: "/companies/new")
        end
      end
    end
  end
end