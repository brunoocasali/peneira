Rails.application.routes.draw do
  default_url_options :host => 'localhost:3000'
  
  concern :paginatable do
    get '(page/:page)', :action => :index, :on => :collection, :as => ''
  end
  
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks',
                                         registrations: 'registrations' }
  resources :athletes, :concerns => :paginatable
  resources :scouts, :concerns => :paginatable
  resources :clubs, :concerns => :paginatable
  resources :preferences, :concerns => :paginatable
  
  get 'welcome/index'
  root 'welcome#index'
end
