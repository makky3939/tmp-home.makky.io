Rails.application.routes.draw do
  
  resources :dashboard, only: [:index]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :logs, only: [:create]
    end
  end

end
