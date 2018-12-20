Rails.application.routes.draw do
  get 'topics/index'
  root 'topics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
