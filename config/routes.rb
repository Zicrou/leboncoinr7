Rails.application.routes.draw do
  resources :modeles
  resources :marques
  resources :cars do
    resources :messages
    collection do
      get :research
    end
  end
  get 'page/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "page#index"
end
