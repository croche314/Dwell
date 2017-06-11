Rails.application.routes.draw do

  # LOGIN
  get 'login' => 'login#index'
  post 'login/register' => 'login#create'
  get 'login/sign_in' => 'login#sign_in'
  post 'login' => 'login#authenticate'
  get 'logout' => 'login#logout'
  get 'landlords/dashboard' => 'landlords#dashboard'
  root 'login#index'

  # LANDLORD
  get 'units/:id/new' => 'units#new'
  get 'units/:id/new_tenant' => 'units#new_tenant'
  get 'units/:id/new_tenant/:query' => 'units#new_tenant'
  get 'units/:id/add_tenant/:tenant_id' => 'units#add_tenant'
  get 'units/:id/remove_tenant/:tenant_id' => 'units#remove_tenant'
  delete 'units/:id/remove_tenant/:tenant_id' => 'units#remove_tenant'
  post '/units/:id' => 'units#show'
  post '/units/:id/edit' => 'units#edit'
  get 'units/:id/lease' => 'units#show_lease'
  post '/units/:id/lease' => 'units#show_lease' 
  delete '/units/:id/lease' => 'units#remove_lease_img'
  delete 'units/:id' => 'units#delete_unit'

  # TENANT
  get 'tenants/dashboard' => 'tenants#dashboard'

  resources :issues
  resources :tenants
  resources :units
  resources :properties
  resources :landlords
  resources :leases
  #get '*path' => 'application#index'
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
