Rails.application.routes.draw do
  devise_for :users
  root to: 'analysisgroups#index'
  resources :equipments, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    member do
      match 'start_analysis', via: [:get, :post]
      match 'finish_analysis', via: [:get, :post]
    end
  end
end

