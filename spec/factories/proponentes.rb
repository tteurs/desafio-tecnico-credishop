FactoryBot.define do
  factory :proponente do
    nome { "MyString" }
    cpf { "MyString" }
    data_nascimento { "2023-11-02" }
    logradouro { "MyString" }
    numero { "MyString" }
    bairro { "MyString" }
    cidade { "MyString" }
    estado { "MyString" }
    cep { "MyString" }
    telefone_pessoal { "MyString" }
    telefone_referencia { "MyString" }
    salario { 1.5 }
  end
end
