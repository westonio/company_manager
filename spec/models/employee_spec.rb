require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'association' do
    it { should belong_to :company }
  end
  
  describe "initialize methods" do
    it 'can concate the first and last name' do
      company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      manila = Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000, company_id: company.id)

      expect(manila.name).to eq("Manila Luzon")
    end
  end
end