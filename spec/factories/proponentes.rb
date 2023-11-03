FactoryBot.define do
  factory :proponente do
    nome { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    data_nascimento { Faker::Date.birthday(min_age: 18, max_age: 65) }
    logradouro { Faker::Address.street_name }
    numero { Faker::Address.building_number }
    bairro { Faker::Address.community }
    cidade { Faker::Address.city }
    estado { Faker::Address.state_abbr }
    cep { Faker::Address.zip_code }
    telefone_pessoal { Faker::PhoneNumber.cell_phone }
    telefone_referencia { Faker::PhoneNumber.cell_phone }
    salario { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
  end
end
