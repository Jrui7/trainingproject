Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"



 root :to => 'pages#home'


  devise_for :users
  resources :seeds, only: [:index, :new, :create, :update, :show], shallow: true do
    resources :picks, only: [:index, :show, :create, :update, :destroy] do
      resources :exchanges, only: [:create, :update]
      resources :payments, only: [:new, :create, :destroy]
    end
    resources :signal_seeds, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show, :edit, :update] do
    member do
        patch :update_card
        put :update_card
      end
  end
  resources :addresses, only: [:update]
  resources :campaigns, only: [:update]


  get 'signaled', to: 'campaigns#signaled'
  get 'pending', to: 'campaigns#pending'
  get 'success', to: 'campaigns#success'
  get 'fail', to: 'campaigns#fail'

  get 'message', to: 'campaigns#message'


  get 'admin', to: 'seeds#admin'
  get 'newest', to: 'seeds#newest'
  get 'popular', to: 'seeds#popular'
  get 'last_day', to: 'seeds#last_day'

  get 'home', to: 'pages#home'
  get 'infos', to: 'pages#infos'
  get 'faq', to: 'pages#faq'
  get 'contact', to: 'pages#contact'
  get 'mentions_legales', to: 'pages#mentions_legales'
  get 'CGV', to: 'pages#CGV'
  get 'CGU', to: 'pages#CGU'


  get 'my_seeds', to: 'my_seedlap#my_seeds'
  get 'my_picks', to: 'my_seedlap#my_picks'

end

