Rails.application.routes.draw do
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
