First::Application.routes.draw do
  require 'resque/server'
  get "friends/index"
  
  First::Application.routes.draw do
    mount Resque::Server.new, at: "/resque"
  end
  
  resources :locations


  get 'social_sites/create'
  get 'social_sites/load_image'
  # get 'registrations/load_image'
 
  devise_for :foundation5s

  devise_for :bootstrap3s

  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
    #get "load_image", :to => "registrations#load_image"
  end
 
  get 'auth/:provider/callback' => 'social_sites#create'

  resources :books  do
    collection do
      get :pdf_generate
      get :load_graduate
      get :search
    end
  end

  resources :friends, :only => [:index] do
    post 'fb_friends', :on => :collection
  end
  match '/auth/facebook/logout' => 'application#facebook_logout', :as => :facebook_logout
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  #match 'books/:id/pdf_generate' => 'books#pdf_generate', :as => :pdf_generate, :via => :get
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  # resources :books do
  #  member do
  #   get 'pdf_generate'
  #       post 'toggle'
  #end
  #
  #     collection do
  #       get 'sold'
  #     end
  #end

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
  root :to => 'books#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
