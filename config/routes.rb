Boardbank::Application.routes.draw do

  root 'frontpage#index'

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :organizations, controllers: { registrations: 'organizations' }

  devise_for :users, controllers: { registrations: 'registrations' }

  ActiveAdmin.routes(self)

  #organization related routes
  devise_scope :organization do
    get '/profile/organization/:id' => 'organizations#show', as: 'org'
    get '/organizations'            => 'organizations#list'
    get 'search_orgs', :to          => 'organizations#list'
  end

  #user realted routes
  get '/profile/user/'         => 'profile#show_user', as: 'user'
  get '/users'                    => 'userlist#show'
  #Testing searchkick through a stackoverflow suggestion:
  #http://stackoverflow.com/questions/15459668/rails-search-form-submit-to-show-method
  #routes.rb
  get 'search_users', :to => 'userlist#show'

  get 'admin/organizations/:id/approve' => 'frontpage#approve_org', as: 'approve_org'
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end
