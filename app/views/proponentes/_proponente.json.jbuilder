json.extract! proponente, :id, :nome, :cpf, :data_nascimento, :logradouro, :numero, :bairro, :cidade, :estado, :cep, :telefone_pessoal, :telefone_referencia, :salario, :created_at, :updated_at
json.url proponente_url(proponente, format: :json)
