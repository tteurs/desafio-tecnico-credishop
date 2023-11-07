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
    desconto = if salario <= 1045.00
                 salario * 0.075
               elsif salario <= 2089.60
                 (1045 * 0.075) + ((salario - 1045) * 0.09)
               elsif salario <= 3134.40
                 (1045 * 0.075) + (1044.60 * 0.09) + ((salario - 2089.60) * 0.12)
               elsif salario <= 6101.06
                 (1045 * 0.075) + (1044.60 * 0.09) + (1044.80 * 0.12) + ((salario - 3134.40) * 0.14)
               else
                 (1045 * 0.075) + (1044.60 * 0.09) + (1044.80 * 0.12) + (2966.66 * 0.14)
               end

    update(desconto_inss: desconto)
  end
end
