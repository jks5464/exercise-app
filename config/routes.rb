Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  get  'my_measurements' => 'measurements#my_measurements', :as => 'my_measurements'
  get  'enter_my_measurements' => 'measurements#enter_my_measurements', :as => 'enter_my_measurements'
  post  'process_enter_new_measurements' => 'measurements#process_enter_new_measurements', :as => 'process_enter_new_measurements'
 
  get  'dashboard' => 'homepage#dashboard', :as => 'dashboard'
  get 'my_goals' => 'goals#my_goals', :as => 'my_goals'
  get 'my_clients' => 'clients#my_clients', :as => 'my_clients'
  get 'my_workouts' => 'workouts#my_workouts', :as => 'my_workouts'
  
  
  root 'homepage#dashboard'

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
