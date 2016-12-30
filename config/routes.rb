Rails.application.routes.draw do
  devise_for :users
  root to: 'frontend/photos#index'

  namespace :users do
    resources :photos
      
  end

  scope module: 'frontend' do 
    get 'about' => 'pages#about', as: :about
    get 'contact' => 'pages#contact', as: :contact 
    get 'photos' => 'photos#index', as: :photos
    get 'photos/:id' => 'photos#show', as: :photo
  end

end
