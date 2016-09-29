Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :logs do
    collection do
      post :time_in
    end
    member do
      post :time_out
    end
  end
end
