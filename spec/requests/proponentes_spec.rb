require 'rails_helper'

RSpec.describe ProponentesController, type: :controller do
  describe 'POST #create' do
    it 'cria um novo proponente com atributos válidos' do
      expect do
        post :create, params: { proponente: attributes_for(:proponente) }
      end.to change(Proponente, :count).by(1)
    end

    it 'não cria um proponente com atributos inválidos' do
      expect do
        post :create, params: { proponente: attributes_for(:proponente, nome: nil) }
      end.not_to change(Proponente, :count)
    end
  end

  describe 'PUT #update' do
    let(:proponente) { create(:proponente) }

    it 'atualiza um proponente com atributos válidos' do
      put :update, params: { id: proponente.id, proponente: { salario: 3000.0 } }
      proponente.reload
      expect(proponente.salario).to eq(3000.0)
    end

    it 'não atualiza um proponente com atributos inválidos' do
      put :update, params: { id: proponente.id, proponente: { salario: -100 } }
      proponente.reload
      expect(proponente.salario).not_to eq(-100)
    end
  end
end
