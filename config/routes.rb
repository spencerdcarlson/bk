Bk::Application.routes.draw do


  get "event_images/index"

  # put 'password/update' => 'password_resets#update'
  # get 'password/reset/confirm' => 'password_resets#edit'
  # get 'password/reset' => 'password_resets#new'
  match 'auth/:provider/callback', to: 'authentications#create'
  match 'auth/failure', to: 'authentications#failure'
  match 'auth/:provider/returning', to: 'authentications#returning'
  get 'authentications' => 'authentications#index'
  get 'register' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'home' => 'users#show'
  get 'edit' => 'users#edit'
  get 'activities' => 'activities#index'
  match '/activities/:activity_id/places/:place_id/images(.:format)', to: 'place_images#index'
  get '/users/:user_id/images(.:format)', to: 'user_images#index'
  get '/users/:user_id/images/:id(.:format)', to: 'user_images#update'
  match '/activities/:activity_id/places/:place_id/events/:id(.:format)', to: 'place_events#show'
  
  post '/users/:user_id/images(.:format)' => 'user_images#create', as: :new_user_image
  delete '/users/:user_id/images/:id(.:format)' => 'user_images#destroy'
  
  get '/activities/:activity_id/places/:place_id/events/:id/images(.:format)', to: 'event_images#index'

  
  resources :sessions
  resources :interests
  resources :password_resets
  
  resources :activities do
    resources :places do
      resources :images
      resources :events do
        resources :images
      end
    end
  end
  
  resources :users do
    resources :interests
    resources :activities
    resources :events
    resources :comments
    resources :images
  end
  
  #  
  #  resources :activities do
  #    resources :interests
  #  end    
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "sessions#new"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
