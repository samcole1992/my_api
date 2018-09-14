Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :buyers
  resources :suppliers
  resources :bids
  resources :offers
  resources :products
  resources :orders
  resources :buyer_reviews
  resources :suppliers_reviews

  post '/supplier_signin' => 'supplier_signin#create', as: 'supplier_signin'

  delete '/supplier_signout' => 'supplier_signin#destroy', as: 'supplier_signout'

  post '/supplier_signup' => 'supplier_signup#create', as: 'supplier_signup'


  post '/buyer_signin' => 'buyer_signin#create', as: 'buyer_signin'

  delete '/buyer_signout' => 'buyer_signin#destroy', as: 'buyer_signout'

  post '/buyer_signup' => 'buyer_signup#create', as: 'buyer_signup'
  
  post '/guest' => 'guest#create', as: 'guest'

end
