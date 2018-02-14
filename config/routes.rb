Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"



 root :to => 'pages#home'


  devise_for :users
  resources :seeds, only: [:index, :new, :create, :update, :show], shallow: true do
    resources :picks, only: [:index, :show, :create, :update, :destroy] do
      resources :exchanges, only: [:create, :destroy]
      resources :payments, only: [:new, :create, :destroy]
    end
    resources :signal_seeds, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show, :edit, :update, :destroy]
  resources :addresses, only: [:update, :destroy]
  resources :campaigns, only: [:update]


  get 'signaled', to: 'campaigns#signaled'
  get 'pending', to: 'campaigns#pending'
  get 'success', to: 'campaigns#success'
  get 'fail', to: 'campaigns#fail'
  get 'admin', to: 'seeds#admin'
  get 'newest', to: 'seeds#newest'
  get 'popular', to: 'seeds#popular'
  get 'last_day', to: 'seeds#last_day'
  get 'faq', to: 'pages#faq'
  get 'home', to: 'pages#home'

  get 'team', to: 'pages#team'
  get 'my_seeds', to: 'my_seedlap#my_seeds'
  get 'my_picks', to: 'my_seedlap#my_picks'

end

