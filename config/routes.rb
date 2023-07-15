Rails.application.routes.draw do
  namespace :admins do
    get 'homes/top'
  end
  root "homes#top"

  devise_for :users, controllers: { sessions: 'users/sessions',registrations: 'users/registrations',passwords: 'users/passwords' }

  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
    devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  namespace :publics do

    resources 'shops' do
      resources 'reviews'
    end

   resources :users do
    resource :follows, only: [:create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
  end
  
    resources :replies, only: [:create]
  end


  devise_for :admins, controllers: { sessions: 'admins/sessions',passwords: 'admins/passwords' }

  namespace :admins do
    resources 'reviews'
    resources 'shops'
    resources 'users'
    resources 'replies'
    get '/' => 'homes#top'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
