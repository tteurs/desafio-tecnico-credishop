# README

Criar uma aplicação “Desconto INSS” no Rails com os seguintes requisitos:

● Rails 5 +;
● PostgreSQL;
● Bootstrap;
● Chart.js;
● Rubocop rails;
● Kaminari;
● Redis;
● Sidekiq

## Especificação funcional

1. Cadastro de proponente(CRUD)

  [X] Nome, CPF, Data de nascimento, endereço(logradouro, número, bairro, cidade, estado, CEP), telefones para contato(pessoais, referências), salário.

  [X] A listagem dos proponentes deve ser utilizada paginação, exibindo apenas 5 resultados por página.

2. Calculo de desconto de INSS

  [ ] No formulário de cadastro do proponente, ao ser informado o valor do salário deve ser feita uma requisição ajax(XHR), que deverá retornar o valor do desconto do INSS. Esse valor deve ser exibido no formulário e registrado no cadastro.

  Como calcular passo a passo

    Tabela para Empregado, Empregado Doméstico e Trabalhador Avulso de 1o de janeiro 2020 a 29 de fevereiro de 2020

    Salário de Contribuição (R$) | Alíquota
    Até R$ 1.045,00 | 7,5%
    De R$ 2.089,61 até R$ 3.134,40 | 12%
    <https://www.inss.gov.br/servicos-do-inss/calculo-da-guia-da-previdencia-social-gps> /tabela-de-contribuicao-mensal/

    Com as novas alíquotas e a nova forma de cálculo progressivo, o desconto do INSS deve ser calculado para cada faixa até que se atinja o valor do salário bruto.
    Entre cada parcela, o cálculo é feito considerando o máximo e o mínimo destas e a alíquota a ser aplicada. Enquanto o valor do salário não é atingido, é considerado o teto da faixa salarial.

    Veja como fica o cálculo para um salário de R$ 3.000,00 como exemplo, que se encontra na 3a faixa:

    De R$ 1.045,01 a R$ 2.089,60 | 9%
    De R$ 3.134,41 até R$ 6.101,06 | 14%

    ● 1a faixa salarial: 1.045,00 x 0,075 = 78,37
    ● 2a faixa salarial: [2.089,60 - 1.045,00] x 0,09 = 1.044,60 x 0,09 = 94,01
    ● Faixa que atinge o salário: [3.000,00 - 2.089,60] x 0,12 = 910,40 x 0,12 = 109,24
    ● Total a recolher: 109,24 + 94,01 + 78,37 = 281,62

## Relatório dos funcionários

  Deve ser criado um relatório para exibir os funcionários agrupando-os por faixas salariais, exibindo quantos funcionários existem em cada faixa salarial, seguindo as faixas:

  Até R$ 1.045,00
  De R$ 1.045,01 a R$ 2.089,60
  De R$ 2.089,61 até R$ 3.134,40
  De R$ 3.134,41 até R$ 6.101,06

  Importante: O relatório deve exibir as informações em listagem assim como em gráfico.

## Observações

[X] Iniciar com pelo menos 10 registros (seed);
[ ] Atualizar salário do funcionário usando mensagens/jobs (redis/sidekiq);
[X] Ao final da programação, utilizar o rubocop-rails e padronizar o seu projeto de acordo com as boas práticas de programação rails.

## Sugestões

[ ] Abordagem TDD (escreva testes, disse o mestre!);
[X] Dockerização (portátil é bom);
[X] Autenticação (desejável).

## Setup

* Ruby version
3.2.2

* System dependencies
● Rails 6.1;
● PostgreSQL;
● Bootstrap;
● Chart.js;
● Rubocop rails;
● Kaminari;
● Redis;
● Sidekiq

### Configuration

$ bundle install

### Database creation

you shoul have postgresql installed

### Database initialization

$ bundle exec rake db:setup && bundle exec rake db:seed

### How to run the test suite

$ bundle exec rspec spec

### Services (job queues, cache servers, search engines, etc.)

$ bundle exec sidekiq start

### running on docker

$ docker-compose up -d
