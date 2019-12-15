Rails.application.routes.draw do
  resources :profiles
  resources :posts
  root 'home#home'
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'
  get 'chatroom', to: 'chatroom#index'
  get 'me', to: 'profiles#me'
  mount ActionCable.server => '/cable'
end
