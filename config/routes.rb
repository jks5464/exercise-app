Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  
  resources :sessions, only: [:create, :destroy]
  get 'splash_screen' => 'splash#splash_screen', :as => 'splash_screen'
  get 'admin' => 'admin#admin', :as => 'admin'
  get  'my_measurements' => 'measurements#my_measurements', :as => 'my_measurements'
  get  'enter_my_measurements' => 'measurements#enter_my_measurements', :as => 'enter_my_measurements'
  post 'process_enter_new_measurements' => 'measurements#process_enter_new_measurements', :as => 'process_enter_new_measurements'
  post 'process_create_workout' => 'workouts#process_create_workout', :as => 'process_create_workout'
  post 'process_new_quick_log' => 'homepage#process_new_quick_log', :as => 'process_new_quick_log'
  post 'process_complete_workout' => 'workouts#process_complete_workout', :as => 'process_complete_workout'
  post 'process_delete_workout' => 'workouts#process_delete_workout', :as => 'process_delete_workout'
  post 'process_clone_workout' => 'workouts#process_clone_workout', :as => 'process_clone_workout'
  post 'process_update_workout_state' => 'workouts#process_update_workout_state', :as => 'process_update_workout_state'
 
  post 'process_delete_exercise' => 'exercises#process_delete_exercise', :as => 'process_delete_exercise'
  
  
  get  'dashboard' => 'homepage#dashboard', :as => 'dashboard'
  get 'my_goals' => 'goals#my_goals', :as => 'my_goals'
  get 'my_clients' => 'clients#my_clients', :as => 'my_clients'
  post 'set_effective_id' => 'sessions#set_effective_id', :as => 'set_effective_id'
  get 'unset_effective_id' => 'sessions#unset_effective_id', :as => 'unset_effective_id'

  get 'my_workouts' => 'workouts#my_workouts', :as => 'my_workouts'
  get 'create_workout' => 'workouts#create_workout', :as => 'create_workout'
  
  get 'create_exercise' => 'workouts#create_exercise', :as => 'create_exercise'
  post 'process_create_exercise' => 'exercises#process_create_exercise', :as => 'process_create_exercise'
  get 'enter_goal' => 'goals#enter_goal', :as => 'enter_goal'
  post 'enter_goal' => 'goals#enter_goal_create', :as => 'enter_goal_create'
  
  get 'quick_log' => 'homepage#quick_log', :as => 'quick_log'
  post 'enter_quick_log' => 'homepage#enter_quick_log', :as => 'enter_quick_log'
  get 'view_exercises' => 'homepage#view_exercises', :as => 'view_exercises'
  get 'search_exercises_json' => 'workouts#search_exercises_json', :as => 'search_exercises_json'
  get 'units_json' => 'workouts#units_json', :as => 'units_json'
  
  
  
 # root 'homepage#dashboard'
 root 'splash#splash_screen'
 #root 'admin#admin'
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
