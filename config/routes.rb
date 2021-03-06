Rails.application.routes.draw do
 
  get 'password_resets/new'

  get 'password_resets/edit'

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
root "pages#show", page: "home"
get "/pages/:page" => "pages#show"
get "/pages/home", to: "pages#home", as: "home"
get "/pages/demo", to: "pages#demo", as: "demo"
get "/pages/plan", to: "pages#plan", as: "plan"
get "/pages/browse", to: "pages#browse", as: "browse"
get "/pages/add", to: "pages#add", as: "add"
get "/pages/about", to: "pages#about", as: "about"
get "/login", to: "sessions#new", as: "login"
post "/login", to: "sessions#create"
delete '/logout', to: "sessions#destroy"
get "/signup", to: "users#new", as: "signup"
post '/signup', to: 'users#create'
resources :users
resources :account_activations, only: [:edit]
resources :password_resets, only: [:edit, :create, :new, :update]
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
