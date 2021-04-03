Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  get '/item/:id', to: 'home#show', as: 'item'
  root to: "home#index"

  authenticate :admin do
    resources :categories
  
    resources :products
      resources :variations 
      resources :options

  end

  resource :cart, only: [:show, :update] do
    member do
      post :pay_with_paypal
      get  :process_paypal_payment
    end
  end

  #Route for search action
  post '/home', to: "home#do_search", as: "do_search"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
