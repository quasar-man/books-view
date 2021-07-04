Rails.application.routes.draw do
  get "manager" => "manager#index"

  namespace :manager do
    resources :categories
    resources :authors
    resources :tags
  end

  get "*path", controller: "application", action: "manager_render_404"
  get "*path", controller: "application", action: "manager_render_500"
end
