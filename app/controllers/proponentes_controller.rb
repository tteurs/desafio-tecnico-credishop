# frozen_string_literal: true

# ProponentesController is the controller responsible for managing the CRUD of Proponente model
class ProponentesController < ApplicationController
  before_action :set_proponente,
                only: %i[show edit update destroy calcular_desconto_inss atualizar_salario]

  # GET /proponentes or /proponentes.json
  def index
    @proponentes = Proponente.order(:id).page(params[:page])
  end

  # GET /proponentes/1 or /proponentes/1.json
  def show; end

  # GET /proponentes/new
  def new
    @proponente = Proponente.new
  end

  # GET /proponentes/1/edit
  def edit; end

  # POST /proponentes or /proponentes.json
  def create
    @proponente = Proponente.new(proponente_params)

    respond_to do |format|
      if @proponente.save
        format.html { redirect_to proponentes_url, notice: 'Proponente was successfully created.' }
        format.json { render :index, status: :created, location: @proponente }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proponente.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /proponentes/1 or /proponentes/1.json
  def update
    respond_to do |format|
      if @proponente.update(proponente_params)
        format.html { redirect_to proponentes_url, notice: 'Proponente was successfully updated.' }
        format.json { render :show, status: :ok, location: @proponente }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proponente.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /proponentes/1 or /proponentes/1.json
  def destroy
    @proponente.destroy

    respond_to do |format|
      format.html { redirect_to proponentes_url, notice: 'Proponente was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  def relatorio_funcionarios
    @faixas_salariais = {
      'Até R$ 1.045,00' => (0..1045.00),
      'De R$ 1.045,01 a R$ 2.089,60' => (1045.01..2089.60),
      'De R$ 2.089,61 até R$ 3.134,40' => (2089.61..3134.40),
      'De R$ 3.134,41 até R$ 6.101,06' => (3134.41..6101.06)
    }

    # adcionar os funcionários por faixa salarial nome e quantidade
    @funcionarios_por_faixa = {}
    @faixas_salariais.each do |faixa, range|
      @funcionarios_por_faixa[faixa] =
        [Proponente.where(salario: range).count, Proponente.where(salario: range).pluck(:nome)]
    end
  end

  def atualizar_salario
    novo_salario = params[:novo_salario].to_f

    SalarioWorkerJob.perform_async(@proponente.id, novo_salario)

    redirect_to proponentes_path, notice: 'Atualização de salário agendada.'
  end

  def calcular_inss(salario = nil)
    salario ||= params[:salario].to_f
    desconto_inss = calcular_desconto_inss(salario)

    render json: { desconto: desconto_inss }
  end

  private

  def calcular_desconto_inss(salario)
    if salario <= 1045.00
      salario * 0.075
    elsif salario <= 2089.60
      (salario - 1045.00) * 0.09 + 78.37
    elsif salario <= 3134.40
      (salario - 2089.60) * 0.12 + 78.37 + 94.01
    elsif salario <= 6101.06
      (salario - 3134.40) * 0.14 + 78.37 + 94.01 + 125.38
    else
      78.37 + 94.01 + 125.38 + 415.33
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_proponente
    @proponente = Proponente.find(params[:id]) unless params[:action] == 'relatorio_funcionarios'
  end

  # Only allow a list of trusted parameters through.
  def proponente_params
    params.require(:proponente).permit(:nome, :cpf, :data_nascimento, :logradouro, :numero, :bairro, :cidade,
                                       :estado, :cep, :telefone_pessoal, :telefone_referencia, :salario, :desconto_inss)
  end
end
