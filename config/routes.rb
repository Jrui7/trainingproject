Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  devise_for :users
  root to: 'pages#home'

  resources :seeds, shallow: true do
    collection do                       # collection => no restaurant id in URL
      get 'mon_seedoak', to: "seeds#mon_seedoak"
    end
    resources :picks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [ :show, :edit, :update, :destroy]

end
