require 'rails_helper'

RSpec.describe PowersController, type: :controller do
  let(:test_alien) { create(:alien) }
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
        delete :delete, id: test_power.id
        expect(response).to redirect_to(:controller => 'aliens', :action => "show", :id => test_alien.id)
      end
    end
  end
end
