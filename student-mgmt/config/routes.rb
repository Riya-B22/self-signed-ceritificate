Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get 'welcome/index'
  root 'welcome#index'
  resources :students
  get '/certificate/expiration_date', to: 'certificate#expiration_date'

end
