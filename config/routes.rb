# -*- encoding : utf-8 -*-
Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'frontend/cities#show'
  scope '/', module: :frontend do
    resources :cities do
      collection do
        get :more
      end
    end
  end
  namespace :cms do
    root 'jobs#index'
    resources :cities
    resources :jobs do
      member do
        get :toggle_visible
      end
    end
    resource :profile do
      get 'edit_password'
      put 'update_password'
    end
    get 'signin', to: 'sessions#new', as: :signin
    post 'signin', to: 'sessions#create'
    get 'signout', to: 'sessions#destroy', as: :signout
    get 'errors/403', to: 'errors#error_403', as: :error_403
    resources :errors
    get '*not_found', to: 'errors#error_404'
  end
end
