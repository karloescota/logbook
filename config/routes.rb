Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :logs do
    member do
      post :time_out
    end
  end
end
