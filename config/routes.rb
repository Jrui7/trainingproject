Rails.application.routes.draw do
  get 'seeds/index'

  get 'seeds/new'

  get 'seeds/show'

  get 'seeds/update'

  get 'seeds/destroy'

  devise_for :users
  root to: 'pages#home'
  resources :seeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
