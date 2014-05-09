FormalChoise::Application.routes.draw do
  
  resources :homes do
    collection do
      get :about_us
    end
  end
  get 'about_us' =>'homes#about_us'
  # devise_for :users
  devise_for :users, controllers: { sessions: 'sessions'}
  # devise_for :users,:skip => [:sessions]
  # as :user do
    # get 'user/signin' => 'devise/sessions#new', :as => :new_user_session
    # post 'signin' => 'devise/sessions#create', :as => :user_session
    # delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
   root :to => "homes#index"
  resources :sellers do
    resources :products,except: [:product_show] do
       resources :images
    end
  end
  resources :products,only: [:product_show] do
    collection do
      get :product_show
    end
  end
  
  
  resources :orders
  resources :line_items
  resources :carts
  resources :buyers
  resources :images
  resources :brands
  resources :categories
  resources :seasions
  resources :tags
  resources :colors
  resources :reviews
  
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
