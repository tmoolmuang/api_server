require 'rails_helper'

RSpec.describe AliensController, type: :controller do
  # note to myself
  # let!(:obj){...} creates immediately and let(:obj){...} will only create obj when the obj is called. 
  # let is lazily evaluated, that is, obj won't come into existence till something is called upon it. 
  let(:test_alien) { create(:alien) }
  
  context "Alien" do
    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns test_alien to all Aliens" do
        get :index
        expect(assigns(:aliens)).to eq([test_alien])
      end
    end

    describe "GET show" do
      it "returns http success" do
        get :show, {id: test_alien.id}
        expect(response).to have_http_status(:success)
      end

      it "renders #show view" do
        get :show, {id: test_alien.id}
        expect(response).to render_template :show
      end

      it "assigns test_alien to @alien" do
        get :show, {id: test_alien.id}
        expect(assigns(:alien)).to eq(test_alien)
      end
    end

    describe "GET new" do
      it "renders #new view" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "POST create" do
      it "returns http redirec to #index view" do
        post :create, alien: { name: test_alien.name, year: test_alien.year, month: test_alien.month, origin: test_alien.origin }
        expect(response).to redirect_to(:action => "index")
      end
      
      it "increases the number of alien by 1" do
        expect{ post :create, alien: {name: "name", year: 1111, month: 11, origin: "origin"} }.to change(Alien, :count).by(1)
      end
    end

    describe "GET edit" do
      it "renders #edit view" do
        get :edit, {id: test_alien.id}
        expect(response).to render_template :edit
      end
    end

    describe "PUT update" do
      it "returns http redirect to #show view" do
        put :update, id: test_alien.id, alien: { name: "New Name", year: 2017, month: 1, origin: "Earth" }
        expect(response).to redirect_to(:action => "show", :id => test_alien.id)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect to #index view" do
        delete :delete, { id: test_alien.id }
        expect(response).to redirect_to(:action => "index")
      end
      
      it "decreases the number of alien by 1" do
        alien_id = test_alien.id
        delete :delete, { id: alien_id }
        count = Alien.where({ id:alien_id }).size
        expect(count).to eq 0
      end
    end
  end
end
