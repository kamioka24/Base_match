Rails.application.routes.draw do
	devise_for :players, :controllers => {
		:sessions => 'player/sessions',
		:registrations => 'player/registrations'
	}

	devise_for :teams, :controllers => {
		:sessions => 'team/sessions',
		:registrations => 'team/registrations'
	}
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# player
	root 'player/home#about' # ネストしたコントローラに対してrootを設定する記述法
	namespace :player do
		resources :players, only: [:show, :edit, :update, :destroy] do
			get :exit, on: :member # idが必要なためmemberを使う
		end
		resources :teams, only: [:index, :show] do
			resource :bookmarks, only: [:create, :destroy] # この２つはid不要。
			resources :bookmarks, only: [:index] # 上に混ぜるとpathが消えるので分けた。
		end
		resources :posts, only: [:index, :show]
		resources :contacts, only: [:new, :create] do
			get :complete, on: :collection # idがないからcollectionを使う
		end
	end

	# team
	namespace :team do
		get 'home/about'
		resources :teams, only: [:index, :show, :edit, :update, :destroy] do
			get :exit, on: :member # idが必要なためmemberを使う
		end
		resources :posts
    end
end
