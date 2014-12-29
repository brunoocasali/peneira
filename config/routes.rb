Rails.application.routes.draw do

  resources :athletes

  resources :scouts

  resources :clubs

  devise_for :users
  
  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end

  resources :preferences
  
  get 'welcome/index'

  #resources :entity, :concerns => :paginatable  
  root 'welcome#index'
end
