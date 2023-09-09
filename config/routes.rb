Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'users#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :posts do
      member do
        post 'like'
        delete 'unlike'
      end
      resources :comments
    end
  end  
end