Rails.application.routes.draw do
  
  
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'users/:id' => 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users
end
