Rails.application.routes.draw do
  devise_for :users
  root to: 'analysisgroups#index'
  resources :equipments, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
