Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root "pages#portfolios", as: :authenticated_root
  end
  root "pages#home"
end