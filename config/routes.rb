Rails.application.routes.draw do
	devise_for :players
	devise_for :teams
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# player
	namespace :player do
		root 'home#about'
		resources :players, only: [:show, :edit, :update, :destroy]
		get 'players/exit'
		resources :teams, only: [:index, :show]
		resources :posts, only: [:index, :show]
		resources :bookmarks, only: [:index, :create, :destroy]
		resources :contacts, only: [:new, :create]
		get 'players/complete'
	end

	# team
	namespace :team do
		get 'home/about'
		resources :teams, only: [:index, :show, :edit, :update, :exit, :destroy]
		resources :posts, only: [:new, :create, :index, :show, :update]
		get 'posts/exit'

    end
end
