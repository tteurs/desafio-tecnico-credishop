require 'rails_helper'

RSpec.describe Proponente, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:nome) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:salario) }
    it { should validate_uniqueness_of(:cpf).case_insensitive }
    it { should validate_numericality_of(:salario).is_greater_than(0) }

    it 'should validate cpf format' do
      proponente = Proponente.new(cpf: '123.456.789-00')
      expect(proponente).to_not be_valid
      expect(proponente.errors[:cpf]).to include('não é válido')
    end
  end

  describe 'methods' do
    let(:proponente) { Proponente.create(nome: 'John Doe', cpf: '123.456.789-10', salario: 3000) }

    it 'should calculate desconto_inss' do
      proponente.calcular_desconto_inss
      expect(proponente.desconto_inss).to eq(281.637)
    end
  end
end
