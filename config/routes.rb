Rails.application.routes.draw do
  resources :players
  resources :rosters
  resources :managers
  resources :leagues do
    resource :draft, only: [:show, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
