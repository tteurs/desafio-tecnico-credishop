require 'rails_helper'

RSpec.describe "proponentes/index", type: :view do
  before(:each) do
    assign(:proponentes, [
      Proponente.create!(
        nome: "Nome",
        cpf: "Cpf",
        logradouro: "Logradouro",
        numero: "Numero",
        bairro: "Bairro",
        cidade: "Cidade",
        estado: "Estado",
        cep: "Cep",
        telefone_pessoal: "Telefone Pessoal",
        telefone_referencia: "Telefone Referencia",
        salario: 2.5
      ),
      Proponente.create!(
        nome: "Nome",
        cpf: "Cpf",
        logradouro: "Logradouro",
        numero: "Numero",
        bairro: "Bairro",
        cidade: "Cidade",
        estado: "Estado",
        cep: "Cep",
        telefone_pessoal: "Telefone Pessoal",
        telefone_referencia: "Telefone Referencia",
        salario: 2.5
      )
    ])
  end

  it "renders a list of proponentes" do
    render
    assert_select "tr>td", text: "Nome".to_s, count: 2
    assert_select "tr>td", text: "Cpf".to_s, count: 2
    assert_select "tr>td", text: "Logradouro".to_s, count: 2
    assert_select "tr>td", text: "Numero".to_s, count: 2
    assert_select "tr>td", text: "Bairro".to_s, count: 2
    assert_select "tr>td", text: "Cidade".to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
    assert_select "tr>td", text: "Cep".to_s, count: 2
    assert_select "tr>td", text: "Telefone Pessoal".to_s, count: 2
    assert_select "tr>td", text: "Telefone Referencia".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
