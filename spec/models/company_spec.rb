require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'association' do
    it { should have_many(:employees) }
  end
end