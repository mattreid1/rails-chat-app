Rails.application.routes.draw do
  get '/', to: 'home#home'
  get 'contact', to: 'home#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
