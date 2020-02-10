Rails.application.routes.draw do
    devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
    scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'posts#index'
    resources :posts, only: [:show, :index] do
      resources :comments
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

