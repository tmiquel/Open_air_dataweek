Rails.application.routes.draw do
  resources :test_boomerangs
  devise_for :users

root to: 'test_boomerangs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
