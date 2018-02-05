Rails.application.routes.draw do
  root 'static_pages#index'
  get 'answer', to: 'static_pages#show'
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
