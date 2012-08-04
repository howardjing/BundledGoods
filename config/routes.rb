BundledGoods::Application.routes.draw do


  resources :questions, :only => :none do

    member do
      post 'start'
      post 'answer'
      post 'explanation'
      post 'end'
    end

  end

  match 'experiment', :to => 'questions#experiment'

  resource :users
  resources :sessions, :only => [:destroy]

  match 'thanks', :to => 'pages#thanks'
  match 'instructions', :to => 'pages#instructions'
  match 'demo1', :to => 'pages#demo1'
  match 'demo2', :to => 'pages#demo2'
  match 'demo3', :to => 'pages#demo3'  
  match 'demo4', :to => 'pages#demo4'

  match 'signout', :to => 'sessions#destroy'

  mathjax 'mathjax'

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
  root :to => 'questions#index'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
