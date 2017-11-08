Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  devise_for :users
  resources :seeds, shallow: true do
    resources :picks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show, :edit, :update, :destroy]

  get 'newest', to: 'seeds#newest'
  get 'popular', to: 'seeds#popular'
  get 'last_day', to: 'seeds#last_day'
  get 'faq', to: 'pages#faq'
  get 'team', to: 'pages#team'
  get 'my_seeds', to: 'my_seedoak#my_seeds'
  get 'my_picks', to: 'my_seedoak#my_picks'

end
