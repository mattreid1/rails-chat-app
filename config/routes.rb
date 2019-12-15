Rails.application.routes.draw do
  resources :profiles
  resources :posts
  root 'home#home'
  #get '/', to: 'home#home'
  get 'contact', to: 'home#contact'
  post 'request_contact', to: 'home#request_contact'
  get 'chatroom', to: 'chatroom#index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
