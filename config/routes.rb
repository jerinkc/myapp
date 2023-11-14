Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do
    member do
      post :comment
    end
  end
end
