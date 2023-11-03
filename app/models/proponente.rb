# frozen_string_literal: true

# Proponente is the model responsible for managing the CRUD of Proponente model
class Proponente < ApplicationRecord
  validates :nome, :salario, presence: true
  validates :salario, numericality: { greater_than: 0 }
  validates :cpf, uniqueness: true, presence: true
  validate :cpf_valid?

  def cpf_valid?
    return if CPF.valid?(cpf)

    errors.add(:cpf)
  end

  paginates_per 5
  def calcular_desconto_inss
    salario_contribuicao = salario

    desconto = if salario_contribuicao <= 1045
                 salario_contribuicao * 0.075
               elsif salario_contribuicao <= 2089.6
                 (1045 * 0.075) + ((salario_contribuicao - 1045) * 0.09)
               else
                 (1045 * 0.075) + ((2089.6 - 1045) * 0.09) + ((salario_contribuicao - 2089.6) * 0.12)
               end

    update(desconto_inss: desconto)
  end
end
