require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/test_job', to: 'test_job#create'

  mount Sidekiq::Web => "/sidekiq"
end
