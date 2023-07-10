Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "pages#portfolios", as: :authenticated_root
  end
  root "pages#home"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :portfolios, only: %i[index show create update destroy]
    end
  end
end