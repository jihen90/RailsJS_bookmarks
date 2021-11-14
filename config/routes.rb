Rails.application.routes.draw do
  resources :types
  resources :categories
  resources :bookmarks
  get 'results', to: 'categories#results', as: 'results'
  root "bookmarks#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
