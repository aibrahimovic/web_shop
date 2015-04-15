Test3::Application.routes.draw do
  get "addresses/new"
  get "items/new"
  post "items/create"
  get "carts/new"
  get "help_products/new" 
  get "products/new"
  get "categories/new"
  get "sessions/new"
  get "static_pages/home"
  get "static_pages/help"
  get "users/new"
  delete "items/destroy"
  put "items/update"
  get "application/get_counter"
  get 'orders/create'
  post 'charges/new'
  get 'charges/create'

  get 'home'       => 'static_pages#home'
  get ' '       => 'static_pages#home'
  get 'categories' => 'categories#new'
  get 'carts' => 'carts#show'
  get 'addresses' => 'address#show'
  get 'charges' => 'charges#create'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'admin' => 'static_pages#admin'
  get 'allProducts' => 'products#allProducts'
  get 'allUsers' => 'users#allUsers'
  get 'orders' => 'orders#show'
  get 'itemsDestroy' => 'items#destroy'
  get 'order' => 'orders#showOrder'

  resources :users
  resources :categories
  resources :products
  resources :help_products
  resources :carts do 
    put "update_item", on: :collection
    delete "delete_item", on: :collection
    get "update_price", on: :collection
    get "check_available", on: :collection
  end
  resources :items do
    delete 'delete_temp_items', on: :collection
  end
  resources :addresses do
    post "add_address", on: :collection
    get "send_to_payment", on: :collection
    get "set_clicked_addresses", on: :collection
  end
  resources :charges do
    get "choosen_addresses", on: :collection
    get "new", on: :collection
  end

  resources :orders

  root to: 'static_pages#home'

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
