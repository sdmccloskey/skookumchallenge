Rails.application.routes.draw do
  resources :books, param: :title

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
