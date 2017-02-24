Rails.application.routes.draw do
  get 'settings/index'

  get 'quotes/index'

    devise_for :users
    root to: 'frontend/search#index'

    namespace :users do
        resources :photos
        resources :quotes
        resources :settings
    end

    scope module: 'frontend' do
        get 'home' => 'search#index', as: :home
        get 'contact' => 'pages#contact', as: :contact
        get 'photos' => 'photos#index', as: :photos
        get 'photos/:id' => 'photos#show', as: :photo
        get 'timeline' => 'pages#timeline', as: :timeline
        get 'search' => 'search#index', as: :search
    end
end
