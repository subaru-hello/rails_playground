# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  # react用のルーティング

  # api用のルーティング
  namespace :api do
    namespace :v1 do
      resources :posts
    end
    resources :youtubes, only: %i[index]
  end
  namespace :api do
    namespace :v2 do
      resources :qiitas, only: %i[index]
    end
  end
  get '*path', to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
