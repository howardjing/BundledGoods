Goods::Application.routes.draw do
  
  resources :users, only: [:new, :create, :edit, :update]
  resource :experiment do
    post :start_question
  end
  
  match 'instructions', to: 'pages#instructions'
  match 'instructions1', :to => 'pages#instructions1'
  match 'instructions2', :to => 'pages#instructions2'
  match 'instructions3', :to => 'pages#instructions3'
  match 'demo4', :to => 'pages#demo4'
  match 'thanks', to: 'pages#thanks'
  match 'signout', to: 'sessions#destroy'
  
  root to: 'pages#instructions'
  
  mathjax 'mathjax'

end
