FormalChoise::Application.routes.draw do
  resources :homes
  devise_for :users
 
   root :to => "homes#index"
  resources :sellers do
    resources :products
  end
  resources :buyers
  
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
