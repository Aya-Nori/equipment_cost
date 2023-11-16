Rails.application.routes.draw do
  get 'analysisgroups/index'
  root "analysisgroups#index"
end
