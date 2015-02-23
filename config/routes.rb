Rails.application.routes.draw do
  
  namespace :admins do
    resources :products
    resources :site_banners
    
    put "/products/:id/show_state"=>"products#show_state",as: :products_show_state
    post "/site/address_create" => "site#address_create"
    get "/site/address_new" => "site#address_new"
    get "/site/address/:id/edit" => "site#address_edit" , as: :site_address_edit
    put "/site/address/address_update" => "site#address_update", as: :site_address

    post "/site/about_us_create"=>"site#about_us_create"
    get "/site/about_us_new"=>"site#about_us_new"
    get "/site/about_us/:id/edit"=>"site#about_us_edit"
    put "/site/about_us/about_us_update"=>"site#about_us_update", as: :site_about_us

    post "/site/service_create"=>"site#service_create"
    get "/site/service_new"=>"site#service_new"
    get "/site/service/:id/edit"=>"site#service_edit"
    put "/site/service/service_update"=>"site#service_update", as: :site_service

    post "/site/contact_create"=>"site#contact_create"
    get "/site/contact_new"=>"site#contact_new"
    get "/site/contact/:id/edit"=>"site#contact_edit"
    put "/site/contact/contact_update"=>"site#contact_update", as: :site_contact

    post "/site/upload"=>"site#upload"
  end

  # devise_for :admins
  devise_for :admins, controllers: { sessions: "admins/sessions" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :products,only:[:index,:show]
  resources :contact,only:[:index]
  resources :about_us,only:[:index]
  resources :service,only:[:index]
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
