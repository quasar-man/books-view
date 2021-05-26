Rails.application.routes.draw do
  get "manager" => "manager#index"

  namespace :manager do
    resources :categories
  end
end
