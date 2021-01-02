Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resource :credentials, only: [] do
        get :me
      end
    end
  end
end
