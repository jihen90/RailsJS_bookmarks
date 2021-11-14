Rails.application.routes.draw do
  resources :bookmarks
  resources :types
  resources :categories
  get 'results', to: 'categories#results', as: 'results'
  root "bookmarks#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
