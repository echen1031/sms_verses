require 'sidekiq/web'

SmsVerses::Application.routes.draw do
  
  

  

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  mount Sidekiq::Web, at: '/sidekiq'
   
  root :to => 'home#index'
  resources :bible_verses, :only => [:index, :show]
  resources :pages

  #devise_for :admins
  devise_for :users
  devise_scope :user do
    get '/logout' => 'devise/sessions#destroy'
    get '/login' => 'devise/sessions#new'
    get '/signout' => 'devise/sessions#destroy'
    get '/signin' => 'devise/sessions#new'
    get '/register' => 'users/registrations#new'    
  end

  resources :users do   
    resources :user_subscriptions do 
      member do
        get :send_now        
      end
    end
  end
end
