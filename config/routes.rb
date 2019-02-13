Rails.application.routes.draw do
  resources :articles
  root :to => 'welcome#home'
  
  resources :users do
    resources :articles
  end
  
end
