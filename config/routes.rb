Rails.application.routes.draw do
  root 'aliens#index'
  
  namespace 'api' do
    namespace 'v1' do
      resources :aliens
    end
  end

  # catch all
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
