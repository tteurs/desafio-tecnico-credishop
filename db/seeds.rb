# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

printf '====== Creating User ... '

# genrerate a default user
if (Rails.env.development? || Rails.env.test?) && User.count.zero?
  User.create!(email: 'teste@teste.com', password: 'password',
               password_confirmation: 'password')
end
printf "DONE! ======\n\n"

printf '====== Creating proponentes ... '
# generate 10 proponentes
10.times do |_proponente|
  Proponente.create!(
    nome: Faker::Name.name,
    cpf: Faker::IDNumber.brazilian_citizen_number,
    data_nascimento: Faker::Date.birthday,
    logradouro: Faker::Address.street_address,
    numero: Faker::Address.building_number,
    bairro: Faker::Address.community,
    cidade: Faker::Address.city,
    estado: Faker::Address.state_abbr,
    cep: Faker::Address.zip_code,
    telefone_pessoal: Faker::PhoneNumber.cell_phone,
    telefone_referencia: Faker::PhoneNumber.cell_phone,
    salario: Faker::Number.decimal(l_digits: 3, r_digits: 2)
  )
end
printf "DONE! ======\n\n"

puts ''
puts '#................................................#'
puts '       acesse o app com esse dados        '
puts '#................................................#'
puts "user: #{User.first.email}"
puts 'senha: password'
puts '#................................................#'
puts '#................................................#'
puts ''
puts ''
