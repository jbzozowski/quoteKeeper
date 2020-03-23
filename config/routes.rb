Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :quotes


  get 'welcome/index'

  root 'welcome#index'

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
