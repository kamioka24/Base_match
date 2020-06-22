Rails.application.routes.draw do
  namespace :team do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :team do
    get 'teams/index'
    get 'teams/show'
    get 'teams/edit'
    get 'teams/exit'
  end
  get 'home/about'
  get 'home/top'
  get 'home/about'
  get 'bookmarks/index'
  get 'posts/index'
  get 'posts/show'
  get 'teams/index'
  get 'teams/show'
  get 'players/show'
  get 'players/edit'
  get 'players/exit'
	devise_for :players
	devise_for :teams
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# player
	namespace :player do
	end

	# team
	namespace :team do
    end
end
