Rails.application.routes.draw do
	devise_for :users, controllers: {
    sessions: "public/sessions",
    registrations: "public/registrations"
  }

  resources :users,only: [:show,:edit,:update,:index] do
    member do
      get 'followers'=> "users/followers#followers"
      get 'followings'=> "users/followings#followigs"
    end
  end
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create]
  end

  resources :book_comments, only: [:destroy]

  root 'home#top'
  get 'home/about'
  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
