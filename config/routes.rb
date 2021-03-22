Rails.application.routes.draw do
  root to: 'jobs#index'
  resources :jobs, only: %i[index create]

  mount JoberEngine::Engine => '/jober'
end
