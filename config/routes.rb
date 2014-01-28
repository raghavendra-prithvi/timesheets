MusicFeedApp::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    get 'welcome/index' => 'welcome#index'
    root 'sessions#new'
    resources :sessions, only: [:new, :create, :destroy]
    get '/registration' => 'registrations#new'
    match '/auth/:provider/callback' => 'sessions#create' , via: [:get, :post]
    match "/auth/failure" => "sessions#failure", via: [:get, :post]
    get '/signin',  to: 'sessions#new'
    get '/signout', to: 'sessions#destroy'
    get '/signup', to: 'users#new'
    get '/about', to: 'static_pages#about'
    get '/contact', to: 'static_pages#contact'
    get '/news', to: 'static_pages#news'
  
    resources :users
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
