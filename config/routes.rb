FormalChoise::Application.routes.draw do
  
  resources :homes
  # devise_for :users
  devise_for :users,:skip => [:sessions]
  as :user do
    get 'user/signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
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
