# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'proponentes#index'
  devise_for :users
  resources :proponentes do
    collection do
      get 'relatorio_funcionarios', action: :relatorio_funcionarios
      get 'calcular_inss', action: :calcular_inss
    end
  end

  post 'proponente_atualizar_salario/:id', to: 'proponentes#atualizar_salario'
end
