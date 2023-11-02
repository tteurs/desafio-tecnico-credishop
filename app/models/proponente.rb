class Proponente < ApplicationRecord
  paginates_per 5
  def calcular_desconto_inss
    salario_contribuicao = salario
    desconto = 0

    if salario_contribuicao <= 1045
      desconto = salario_contribuicao * 0.075
    elsif salario_contribuicao <= 2089.6
      desconto = (1045 * 0.075) + ((salario_contribuicao - 1045) * 0.09)
    else
      desconto = (1045 * 0.075) + ((2089.6 - 1045) * 0.09)
      desconto += ((salario_contribuicao - 2089.6) * 0.12)
    end

    update(desconto_inss: desconto)
  end
end
