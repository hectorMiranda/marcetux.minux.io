Rails.application.routes.draw do
  get 'settings/index'

  get 'quotes/index'

    devise_for :users
    root to: 'frontend/pages#home'

    namespace :users do
        resources :photos
        resources :quotes
        resources :settings
    end

    scope module: 'frontend' do
        get 'home' => 'pages#home', as: :home
        get 'contact' => 'pages#contact', as: :contact
        get 'photos' => 'photos#index', as: :photos
        get 'photos/:id' => 'photos#show', as: :photo
        get 'timeline' => 'pages#timeline', as: :timeline
    end
end
