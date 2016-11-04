Rails.application.routes.draw do
  root 'pages#index'
  get 'about' => 'pages#about'

  get 'tags/:tag', to: 'recipes#index', as: :tag
  get 'tags', to: 'recipes#tags'
  get 'recipes/type', to: 'recipes#type'
  post 'recipes/type', to: 'recipes#post_type'
  resources :recipes

  devise_for :users, controllers: {
    # confirmations:      'users/confirmations',
    # omniauth_callbacks: 'users/omniauth_callbacks',
    passwords:          'users/passwods',
    registrations:      'users/registrations',
    sessions:           'users/sessions',
    # unlocks:            'users/unlocks'
  }
  resources :users, only: :show
  resources :ingredients

  # Common Devise customizations
  # after_sign_in_path_for ''
  # after_sign_out_path_for ''
  # devise_for :users, path: "auth", path_names: {
  #   sign_in: 'login',
  #   sign_out: 'logout',
  #   password: 'secret',
  #   confirmation: 'verification',
  #   unlock: 'unblock',
  #   registration: 'register',
  #   sign_up: 'cmon_let_me_in'
  # }

  # The priority is based upon order of creation: first created -> highest
  # priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions
  # automatically):
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
