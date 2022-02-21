Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # resources :ControllerNameでRailsで定義されている7アクションのルーティングを設定
  root "tasks#index"

  resources :tasks
  # root "articles#index"
end
