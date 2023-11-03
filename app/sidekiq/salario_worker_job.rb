class SalarioWorkerJob
  include Sidekiq::Job

  def perform(proponente_id, novo_salario)
    proponente = Proponente.find(proponente_id)
    proponente.update(salario: novo_salario)
  end
end
