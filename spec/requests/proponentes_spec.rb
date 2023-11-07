# spec/controllers/proponentes_controller_spec.rb

require 'rails_helper'

RSpec.describe ProponentesController, type: :controller do
  before(:each) do
    @user = create(:user) # Use your User factory to create a user
    sign_in @user # Assuming you are using Devise for authentication
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      proponente = FactoryBot.create(:proponente)
      get :show, params: { id: proponente.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new proponente' do
      proponente_params = FactoryBot.attributes_for(:proponente)
      expect do
        post :create, params: { proponente: proponente_params }
      end.to change(Proponente, :count).by(1)
    end

    it 'redirects to index on success' do
      proponente_params = FactoryBot.attributes_for(:proponente)
      post :create, params: { proponente: proponente_params }
      expect(response).to redirect_to(proponentes_url)
    end
    # Add more tests for failure cases
  end

  describe 'PUT #update' do
    it 'updates a proponente' do
      proponente = FactoryBot.create(:proponente)
      updated_attributes = { nome: 'Updated Name' }
      put :update, params: { id: proponente.id, proponente: updated_attributes }
      proponente.reload
      expect(proponente.nome).to eq('Updated Name')
    end

    it 'redirects to index on success' do
      proponente = FactoryBot.create(:proponente)
      put :update, params: { id: proponente.id, proponente: FactoryBot.attributes_for(:proponente) }
      expect(response).to redirect_to(proponentes_url)
    end
    # Add more tests for failure cases
  end

  describe 'DELETE #destroy' do
    it 'destroys a proponente' do
      proponente = FactoryBot.create(:proponente)
      expect do
        delete :destroy, params: { id: proponente.id }
      end.to change(Proponente, :count).by(-1)
    end

    it 'redirects to index on success' do
      proponente = FactoryBot.create(:proponente)
      delete :destroy, params: { id: proponente.id }
      expect(response).to redirect_to(proponentes_url)
    end
  end

  it 'GET #relatorio_funcionarios returns a successful response' do
    get relatorio_funcionarios_proponentes_path
    expect(response).to be_successful
  end

  it 'GET #relatorio_funcionarios assigns faixas_salariais and funcionarios_por_faixa' do
    get relatorio_funcionarios_proponentes_path
    expect(assigns(:faixas_salariais)).not_to be_nil
    expect(assigns(:funcionarios_por_faixa)).not_to be_nil
  end

  it 'POST #atualizar_salario should enqueue a job to update the salary' do

    proponente = create(:proponente)
    novo_salario = 3000.0

    expect {
      post atualizar_salario_proponente_path(proponente, novo_salario: novo_salario)
    }.to have_enqueued_job(SalarioWorkerJob)
  end

  it 'GET #calcular_inss returns a valid JSON response' do
    salario = 2000.0
    get calcular_inss_proponentes_path, params: { salario: salario }, xhr: true

    expect(response).to be_successful
    response_json = JSON.parse(response.body)
    expect(response_json).to have_key('desconto')
    expect(response_json['desconto']).to be_a(Float)
  end

end
