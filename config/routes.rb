Boardbank::Application.routes.draw do

  root 'frontpage#index'

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :organizations, controllers: { registrations: 'organizations' }

  devise_for :users, controllers: { registrations: 'users' }

  ActiveAdmin.routes(self)

  #organization related routes
  devise_scope :organization do
    get '/profile/organization/:id' => 'organizations#show', as: 'org'
    get '/organizations'            => 'organizations#index'
    get 'search_orgs', :to          => 'organizations#index'
  end

  #user realted routes
  devise_scope :user do
    get '/profile/user(/:id)'         => 'users#show', as: 'user'
    get '/users'                    => 'users#index'
    get 'search_users', :to         => 'users#index'
  end

  get 'admin/organizations/:id/approve' => 'frontpage#approve_org', as: 'approve_org'
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

end
