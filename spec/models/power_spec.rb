require 'rails_helper'

RSpec.describe Power, type: :model do
  let(:test_power) { create(:power) }
  it { is_expected.to belong_to(:alien) }
  it { is_expected.to validate_presence_of(:ability) }
  
  describe "attributes" do
    it "has ability" do
      expect(test_power).to have_attributes(ability: test_power.ability)
    end
  end
end
