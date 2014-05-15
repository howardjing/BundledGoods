Goods::Application.routes.draw do
  
  resources :users, only: [:new, :create, :edit, :update]
  resource :experiment do
    post :start_question
    get :instructions
    get :wait
  end
  resources :stats, only: [:create]

  namespace :statistics do
    root to: 'users#index'     
    resources :reports, only: [:none] do
      collection do 
        get :questions
        get :interactions
      end
    end
    
    resources :users, only: [:index, :show] do
      collection do 
        get :overall
      end
    end
    resources :questions, only: [:index, :new]
    resources :combos, only: [:index, :show]
    resources :medians, only: [:index, :show]
  end  

  match 'instructions', to: 'pages#instructions'
  match 'instructions1', :to => 'pages#instructions1'
  match 'instructions2', :to => 'pages#instructions2'
  match 'instructions3', :to => 'pages#instructions3'
  match 'instructions4', :to => 'pages#instructions4'
  match 'demo4', :to => 'pages#demo4'
  match 'thanks', to: 'pages#thanks'
  match 'signout', to: 'sessions#destroy'
  
  root to: 'pages#instructions'
  
  mathjax 'mathjax'

end
