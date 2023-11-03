# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'proponentes#index'
  devise_for :users
  resources :proponentes do
    collection do
      get 'relatorio_funcionarios'
      get 'calcular_inss'
    end
  end
end
