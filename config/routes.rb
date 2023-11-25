Rails.application.routes.draw do
  devise_for :users
  # get 'analysisgroups/index'
  root to: 'analysisgroups#index'
  resources :equipments, only: :index
end
