Rails.application.routes.draw do
  root to: 'posts#index'
  resources :users
  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :posts, shallow: true do
    resources :comments
    resources :likes, only: %i[create destroy]
    collection do
      get :like_posts
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
