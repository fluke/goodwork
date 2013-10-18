Goodwork::Application.routes.draw do


  resources :categories

  devise_for :administrators
  devise_for :ngos
  root :to => "donation#new"
  get "admin/index" => "admin#index"
  get "donation/new" => "donation#new" 
  post "donation/create" => "donation#create", as: 'donations'
  get "donation/done" => "donation#done"
  get "admin/unapproved" => "admin#unapproved"
  get "admin/approve/:id" => "admin#approve", as: 'admin_approved'
    get "admin/unapprove/:id" => "admin#unapprove", as: 'admin_unapprove'
    get "profiles/:id" => "home#profile"
    get "edit/:id" => "home#edit"
    get "myitems/:id" => "home#myitems"
    get "admin/pending/:id" => "admin#pending", as: 'admin_pending'
      get "admin/done/:id" => "admin#done", as: 'admin_done'
      get "myitems/:id/done/:item_id" => "home#done", as: 'home_done'
    get "admin/pending_donations" =>"admin#pending_donations"
    get "welcome" => "home#welcome", as: 'home_welcome'
    get "about" => "home#about", as: 'home_about'
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
