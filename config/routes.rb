Rails.application.routes.draw do
  get 'users/ma_collection'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :topics
  devise_for :users 
	resources :users do
		get 'ma_collection', on: :member
	end
  root to: 'topics#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
