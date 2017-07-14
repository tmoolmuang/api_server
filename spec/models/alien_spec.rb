require 'rails_helper'

RSpec.describe Alien, type: :model do
  let(:test_alien) { create(:alien) }
  it { is_expected.to have_many(:powers) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:year) }
  it { is_expected.to validate_presence_of(:month) }
  it { is_expected.to validate_presence_of(:origin) }
  
  describe "attributes" do
    it "has name, year, month, and origin" do
      expect(test_alien).to have_attributes(name: test_alien.name, year: test_alien.year, month: test_alien.month, origin: test_alien.origin)
    end
  end
end
