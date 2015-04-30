Rails.application.routes.draw do


  get 'addfriend/home'

  get 'my_account/home'

  get 'review/home'

  get 'sessions/new'
  
  get 'arestaurant/home'

  get 'search/home'

  get 'wait/home'

  get 'recom/home'
  
  get 'signup/new'
  
  root 'static_pages#home'
  
  get 'home' => 'static_pages#home'

  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  
  
  get 'signup' => 'signup#new'

  get 'signin' => 'sessions#new'
  get 'signout' => 'sessions#destroy'
  get 'sessions' => 'sessions#create'
  get 'facebook' => 'sessions#facebook'
  get 'recom' => 'recom#home'
  get 'wait' => 'wait#home'
  get 'my_account' => 'my_account#home'
  get 'addfriend' => 'addfriend#home'

  get 'search' => 'search#home'
  get 'arestaurant' => 'arestaurant#home'
 
  get 'testmap' => 'search#testmap'
  get 'testloc' => 'search#testloc'
  get 'testdb' => 'sessions#testdb'
  get 'testjava' => 'wait#java'
  get 'testgeo' => 'search#testgeo'
  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


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
