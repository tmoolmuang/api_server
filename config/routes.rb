Rails.application.routes.draw do
  root 'aliens#index'

  # catch all
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
