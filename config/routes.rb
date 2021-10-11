Rails.application.routes.draw do
  # resources :comments
  devise_for :authors
  #get 'articles/new'
  #get 'articles/index'
  resources :articles do
    resources :comments
  end
  
  get 'estaticas/contacto'
  get 'estaticas/nosotros'
  get 'estaticas/otra'
  #get 'home/index'
  #root 'home#index'
  root 'articles#index'

  get '*path' => redirect('/')
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
