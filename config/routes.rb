Rails.application.routes.draw do
  devise_for :users
  root 'aliens#home'
  
  namespace 'api' do
    namespace 'v1' do
      resources :aliens
    end
  end
  
  resources :aliens do
    resources :powers, except: [:index] 
  end  

end
