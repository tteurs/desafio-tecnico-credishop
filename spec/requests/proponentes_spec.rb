require 'rails_helper'

RSpec.describe ProponentesController, type: :controller do
  before(:each) do
    ActiveJob::Base.queue_adapter = :test
    @user = create(:user)
    sign_in @user
  end

  it { should use_before_action(:authenticate_user!) }

  describe 'GET #index' do
    it { should route(:get, '/proponentes').to(action: :index) }
    it { should respond_with(200) }
  end

  describe 'GET #show' do
    let(:proponente) { FactoryBot.create(:proponente) }

    it { should route(:get, "/proponentes/#{proponente.id}").to(action: :show, id: proponente.id) }
    it { should respond_with(200) }
  end

  describe 'POST #create' do
    it { should route(:post, '/proponentes').to(action: :create) }
    it {
      should permit(:nome, :other_attributes).for(:create,
                                                  params: { proponente: FactoryBot.attributes_for(:proponente) })
    }
    it { should change(Proponente, :count).by(1).when(:create) }
    it { should redirect_to(proponentes_path).when(:create) }
  end

  describe 'PUT #update' do
    let(:proponente) { FactoryBot.create(:proponente) }

    it { should route(:put, "/proponentes/#{proponente.id}").to(action: :update, id: proponente.id) }
    it {
      should permit(:nome, :other_attributes).for(:update,
                                                  params: { id: proponente.id,
                                                            proponente: FactoryBot.attributes_for(:proponente) })
    }
    it {
      should change(proponente, :nome).to('Updated Name').when(:update,
                                                               params: { id: proponente.id,
                                                                         proponente: { nome: 'Updated Name' } })
    }
    it { should redirect_to(proponentes_path).when(:update) }
  end

  describe 'DELETE #destroy' do
    let(:proponente) { FactoryBot.create(:proponente) }

    it { should route(:delete, "/proponentes/#{proponente.id}").to(action: :destroy, id: proponente.id) }
    it { should change(Proponente, :count).by(-1).when(:destroy, params: { id: proponente.id }) }
    it { should redirect_to(proponentes_path).when(:destroy) }
  end

  describe 'GET #relatorio_funcionarios' do
    it { should route(:get, '/proponentes/relatorio_funcionarios').to(action: :relatorio_funcionarios) }
    it { should respond_with(200) }
  end

  it 'GET #relatorio_funcionarios assigns faixas_salariais and funcionarios_por_faixa' do
    get :relatorio_funcionarios, format: :json
    expect(assigns(:faixas_salariais)).not_to be_nil
    expect(assigns(:funcionarios_por_faixa)).not_to be_nil
  end

  describe 'POST #atualizar_salario' do
    let(:proponente) { create(:proponente) }

    it {
      should route(:post, "/proponente_atualizar_salario/#{proponente.id}").to(action: :atualizar_salario,
                                                                               id: proponente.id)
    }
    it {
      should(use_after_commit(:atualizar_salario).on(:proponente).when do
               post :atualizar_salario, params: { id: proponente.id, novo_salario: 3000.0 }
             end)
    }
  end

  describe 'GET #calcular_inss' do
    it { should route(:get, '/proponentes/calcular_inss').to(action: :calcular_inss) }
    it { should respond_with(200) }
  end
end
