require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'association' do
    it { should have_many(:employees) }
  end

  describe 'instance methods' do
    it 'calculates count of employees' do
      company = Company.create!(name: "Frank & Roze", federal_ein: 123456789, non_profit: false, address_line_1: "4097 E 9th Ave", address_line_2: "", city: "Denver", state: "CO", zipcode: "80220")
      Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000, company_id: company.id)
      Employee.create!(first_name: "Latrice", last_name: "Royale", i9_eligible: true, benefits_eligible: false, salary: 95000, company_id: company.id)
      Employee.create!(first_name: "Latrice", last_name: "Royale", i9_eligible: true, benefits_eligible: false, salary: 95000, company_id: company.id)

      expect(company.employee_count).to eq(3)
    end
  end
end