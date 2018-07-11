require 'api_constraints'

Rails.application.routes.draw do
  resources :quotes


  get 'welcome/index'

  root 'welcome#index'

    namespace :api, defaults: { format: :json }, path: '/api' do
      scope '/v1', module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
        get 'quotes/random', to: 'quotes#random'
        resources :quotes, :only => [:show, :index] do
        end
      end
    end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
