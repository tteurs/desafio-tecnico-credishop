require 'rails_helper'

RSpec.describe "proponentes/show", type: :view do
  before(:each) do
    @proponente = assign(:proponente, Proponente.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Logradouro/)
    expect(rendered).to match(/Numero/)
    expect(rendered).to match(/Bairro/)
    expect(rendered).to match(/Cidade/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(/Cep/)
    expect(rendered).to match(/Telefone Pessoal/)
    expect(rendered).to match(/Telefone Referencia/)
    expect(rendered).to match(/2.5/)
  end
end
