Rails.application.routes.draw do
  get 'estaticas/contacto'
  get 'estaticas/nosotros'
  get 'estaticas/otra'
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
