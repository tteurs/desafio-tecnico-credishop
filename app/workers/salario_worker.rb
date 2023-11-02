# frozen_string_literal: true

# SalarioWorker is a worker responsible for updating a proponente's salary
class SalarioWorker
  include Sidekiq::Worker

  def perform(proponente_id, novo_salario)
    proponente = Proponente.find(proponente_id)
    proponente.update(salario: novo_salario)
  end
end
