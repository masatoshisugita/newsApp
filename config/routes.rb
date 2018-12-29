Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  get 'topics/index' => 'topics#index'
  root 'topics#index'

  resources :topics

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
