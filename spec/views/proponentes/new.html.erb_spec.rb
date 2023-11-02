require 'rails_helper'

RSpec.describe "proponentes/new", type: :view do
  before(:each) do
    assign(:proponente, Proponente.new(
      nome: "MyString",
      cpf: "MyString",
      logradouro: "MyString",
      numero: "MyString",
      bairro: "MyString",
      cidade: "MyString",
      estado: "MyString",
      cep: "MyString",
      telefone_pessoal: "MyString",
      telefone_referencia: "MyString",
      salario: 1.5
    ))
  end

  it "renders new proponente form" do
    render

    assert_select "form[action=?][method=?]", proponentes_path, "post" do

      assert_select "input[name=?]", "proponente[nome]"

      assert_select "input[name=?]", "proponente[cpf]"

      assert_select "input[name=?]", "proponente[logradouro]"

      assert_select "input[name=?]", "proponente[numero]"

      assert_select "input[name=?]", "proponente[bairro]"

      assert_select "input[name=?]", "proponente[cidade]"

      assert_select "input[name=?]", "proponente[estado]"

      assert_select "input[name=?]", "proponente[cep]"

      assert_select "input[name=?]", "proponente[telefone_pessoal]"

      assert_select "input[name=?]", "proponente[telefone_referencia]"

      assert_select "input[name=?]", "proponente[salario]"
    end
  end
end
