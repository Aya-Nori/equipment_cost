Rails.application.routes.draw do
  devise_for :users
  root to: 'analysisgroups#index'
  resources :equipments, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    member do
      match 'start_analysis', via: [:get, :post]
      match 'finish_analysis', via: [:get, :post]
      match 'start_finish_analysis', via: [:get, :post]
    end
    collection do
      get 'all_list'
    end
  end

  resources :start_finish_times, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    member do
      match 'start_analysis', via: [:get, :post]
      match 'finish_analysis', via: [:get, :post]
    end
  end

end