Rails.application.routes.draw do

  root to: "nfl_results#index"
  # Routes for the Nfl_result resource:
  # CREATE
  get "/nfl_results/new", :controller => "nfl_results", :action => "new"
  post "/create_nfl_result", :controller => "nfl_results", :action => "create"

  # READ
  get "/nfl_results", :controller => "nfl_results", :action => "index"
  get "/nfl_results/:id", :controller => "nfl_results", :action => "show"

  # UPDATE
  # get "/nfl_results/:id/edit", :controller => "nfl_results", :action => "edit"
  # post "/update_nfl_result/:id", :controller => "nfl_results", :action => "update"

  # # DELETE
  # get "/delete_nfl_result/:id", :controller => "nfl_results", :action => "destroy"
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
