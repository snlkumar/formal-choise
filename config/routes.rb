FormalChoise::Application.routes.draw do
  resources :homes
  # devise_for :users
  devise_for :users,:skip => [:sessions]
  as :user do
    get 'admin/signin' => 'devise/sessions#new', :as => :admin_new_user_session
  end
   root :to => "homes#index"
  resources :sellers do
    resources :products do
       resources :images
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
  resources :ratings
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
