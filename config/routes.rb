Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'
  
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  
  resources :sessions, only: [:create, :destroy]
  
  # Splash Controller
  get 'splash_screen' => 'splash#splash_screen', :as => 'splash_screen'
  
  # Admin Controller
  get 'admin' => 'admin#admin', :as => 'admin'
  get 'search_users_json' => 'admin#search_users_json', :as => 'search_users_json'
  post 'process_admin' => 'admin#process_admin', :as => 'process_admin'
  post 'process_delete_client' => 'admin#process_delete_client', :as => 'process_delete_client'
  post 'process_add_client' => 'admin#process_add_client', :as => 'process_add_client'
  
  # Measurements Controller
  get  'my_measurements' => 'measurements#my_measurements', :as => 'my_measurements'
  get  'enter_my_measurements' => 'measurements#enter_my_measurements', :as => 'enter_my_measurements'
  post 'process_enter_new_measurements' => 'measurements#process_enter_new_measurements', :as => 'process_enter_new_measurements'
  post 'process_update_measurements' => 'measurements#process_update_measurements', :as => 'process_update_measurements'
  post 'process_delete_measurement' => 'measurements#process_delete_measurement', :as => 'process_delete_measurement'
  
  # Workouts Controller
  get 'create_exercise' => 'workouts#create_exercise', :as => 'create_exercise'
  get 'my_workouts' => 'workouts#my_workouts', :as => 'my_workouts'
  get 'create_workout' => 'workouts#create_workout', :as => 'create_workout'
  get 'search_exercises_json' => 'workouts#search_exercises_json', :as => 'search_exercises_json'
  get 'units_json' => 'workouts#units_json', :as => 'units_json'
  post 'process_create_workout' => 'workouts#process_create_workout', :as => 'process_create_workout'
  post 'process_complete_workout' => 'workouts#process_complete_workout', :as => 'process_complete_workout'
  post 'process_delete_workout' => 'workouts#process_delete_workout', :as => 'process_delete_workout'
  post 'process_clone_workout' => 'workouts#process_clone_workout', :as => 'process_clone_workout'
  post 'process_update_workout_state' => 'workouts#process_update_workout_state', :as => 'process_update_workout_state'
  post 'process_update_exercise_set' => 'workouts#process_update_exercise_set', :as => 'process_update_exercise_set'
  
  # Homepage Controller
  get 'view_exercises' => 'homepage#view_exercises', :as => 'view_exercises'
  get 'quick_log' => 'homepage#quick_log', :as => 'quick_log'
  get  'dashboard' => 'homepage#dashboard', :as => 'dashboard'
  post 'enter_quick_log' => 'homepage#enter_quick_log', :as => 'enter_quick_log'
  post 'process_new_quick_log' => 'homepage#process_new_quick_log', :as => 'process_new_quick_log'
 
  # Exercises Controller
  post 'process_create_exercise' => 'exercises#process_create_exercise', :as => 'process_create_exercise'
  post 'process_delete_exercise' => 'exercises#process_delete_exercise', :as => 'process_delete_exercise'
  post 'process_update_exercises' => 'exercises#process_update_exercises', :as => 'process_update_exercises'
  
  # Goals Controller
  get 'my_goals' => 'goals#my_goals', :as => 'my_goals'
  get 'enter_goal' => 'goals#enter_goal', :as => 'enter_goal'
  post 'enter_goal' => 'goals#enter_goal_create', :as => 'enter_goal_create'
  post 'process_delete_goal' => 'goals#process_delete_goal', :as => 'process_delete_goal'
  post 'process_update_goals' => 'goals#process_update_goals', :as => 'process_update_goals'
  
  # Client Controller
  get 'my_clients' => 'clients#my_clients', :as => 'my_clients'
  
  # Sessions Controller
  get 'unset_effective_id' => 'sessions#unset_effective_id', :as => 'unset_effective_id'
  post 'set_effective_id' => 'sessions#set_effective_id', :as => 'set_effective_id'
  
  
  root 'splash#splash_screen'
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
