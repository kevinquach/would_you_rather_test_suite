WouldYouRather::Application.routes.draw do
  resources :questions, shallow: true do
    resources :options
  end

  resources :options, shallow: true do
    resources :votes, only: [:create]
  end

  root 'questions#index'
end

