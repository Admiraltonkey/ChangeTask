Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    get 'users/show'
    get "search", to: "search#search"
    get '/moon', to: 'application#moon', as: 'moon'
    get '/sun', to: 'application#sun', as: 'sun'
    get 'posts/:id/donate', to: 'posts#donate'
    get '/top', to: 'posts#top'
    root 'posts#index'
    resources :comments do
      resources :likes
    end
    resources :users do
      resources :abouts
    end
    resources :posts, only: [:show, :index, :update] do
      resources :comments
      resources :reviews
      resources :news
    end
    resources :tags, only: [:show]
    resources :categories, only: [:show]

    namespace :admin do
      resources :posts, except: [:show, :index]
      resources :categories, except: [:show]
      resources :pictures, only: [:create, :destroy]
    end
  end
end

