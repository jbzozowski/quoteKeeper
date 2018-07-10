require 'api_constraints'

Rails.application.routes.draw do
  resources :quotes


  get 'welcome/index'

  root 'welcome#index'

    namespace :api, defaults: { format: :json }, path: '/api' do
      scope '/v1', module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
        resources :quotes, :only => [:show, :index] do
          # add a route for getting a random
          collection do
            # When we don't have a specific ID
          end

          member do
            # When we are given an ID of a specific quote
          end
        end
      end
    end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
