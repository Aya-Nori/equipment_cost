Rails.application.routes.draw do
  devise_for :users
  get 'analysisgroups/index'
  root "analysisgroups#index"
end
