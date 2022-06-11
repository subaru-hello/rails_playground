# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :youtubes, only: %i[index]
  end
  namespace :api do
    namespace :v2 do
      resources :qiitas, only: %i[index]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
