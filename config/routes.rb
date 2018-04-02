Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'teasers#index'

  resources :teasers, :news, :actions, :houses
  resources :sponsors, only: [:new, :edit, :create]

  get 'admin', to: 'application#admin'
  get 'logout', to: 'application#logout'

end
