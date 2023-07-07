require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'association' do
    xit { should belongs_to(:company) }
  end
  
  describe "initialize methods" do
    it 'can concate the first and last name' do
      manila = Employee.create!(first_name: "Manila", last_name: "Luzon", i9_eligible: true, benefits_eligible: false, salary: 69000)

      expect(manila.name).to eq("Manila Luzon")
    end
  end
end