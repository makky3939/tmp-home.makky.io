Rails.application.routes.draw do

  root to: redirect('/dashboard')

  resources :dashboard, only: [:index]

  resources :logs, only: [:index, :show]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :logs, only: [:index, :create]
    end
  end

end
