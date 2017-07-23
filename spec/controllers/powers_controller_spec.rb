require 'rails_helper'

RSpec.describe PowersController, type: :controller do
  let!(:test_alien) { create(:alien) }
  let(:test_power) { create(:power, alien: test_alien) }
  
  context "Power" do
    describe "GET new" do
      it "renders #new view" do
        get :new, { alien_id: test_alien.id }
        expect(response).to render_template :new
      end
    end

    describe "POST create" do
      it "returns http redirect to aliens/#show view" do
        post :create, alien_id: test_alien.id, power: { ability: test_power.ability }
        expect(response).to redirect_to(:controller => 'aliens', :action => "show", :id => test_alien.id)
      end

      it "increases the number of power by 1" do
        expect{ post :create, alien_id: test_alien.id, power: { ability: "New Ability" } }.to change(Power, :count).by(1)
      end
    end

    describe "GET edit" do
      it "renders #edit view" do
        get :edit, alien_id: test_alien.id, id: test_power.id
        expect(response).to render_template :edit
      end
    end

    describe "PUT update" do
      it "returns http redirect to alien/#show view" do
        put :update, alien_id: test_alien.id, id: test_power.id, power: { ability: "New Ability" }
        expect(response).to redirect_to(:controller => 'aliens', :action => "show", :id => test_alien.id)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect to alien/#show view" do
        delete :destroy, alien_id: test_alien.id, id: test_power.id
        expect(response).to redirect_to alien_path(test_alien) #(:controller => 'aliens', :action => "show", :id => test_alien.id)
      end
      
      it "decreases the number of power by 1" do
        power_id = test_power.id
        delete :destroy, alien_id: test_alien.id, id: power_id
        count = Power.where({ id: power_id }).size
        expect(count).to eq 0
      end
    end
  end
end
