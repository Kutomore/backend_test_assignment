# frozen_string_literal: true

Rails.application.routes.draw do
  resources :car_recommendations, only: :index
end
