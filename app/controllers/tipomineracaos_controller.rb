class TipomineracaosController < ApplicationController
  before_action :set_tipomineracao, only: [:show, :edit, :update, :destroy]

  # GET /tipomineracaos
  # GET /tipomineracaos.json
  def index
    @tipomineracaos = Tipomineracao.all
  end

  # GET /tipomineracaos/1
  # GET /tipomineracaos/1.json
  def show
  end

  # GET /tipomineracaos/new
  def new
    @tipomineracao = Tipomineracao.new
  end

  # GET /tipomineracaos/1/edit
  def edit
  end

  # POST /tipomineracaos
  # POST /tipomineracaos.json
  def create
    @tipomineracao = Tipomineracao.new(tipomineracao_params)

    respond_to do |format|
      if @tipomineracao.save
        format.html { redirect_to @tipomineracao, notice: 'Tipo de Mineracao criado com sucesso.' }
        format.json { render :show, status: :created, location: @tipomineracao }
      else
        format.html { render :new }
        format.json { render json: @tipomineracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipomineracaos/1
  # PATCH/PUT /tipomineracaos/1.json
  def update
    respond_to do |format|
      if @tipomineracao.update(tipomineracao_params)
        format.html { redirect_to @tipomineracao, notice: 'Tipo de Mineracao atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @tipomineracao }
      else
        format.html { render :edit }
        format.json { render json: @tipomineracao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipomineracaos/1
  # DELETE /tipomineracaos/1.json
  def destroy
    @tipomineracao.destroy
    respond_to do |format|
      format.html { redirect_to tipomineracaos_url, notice: 'Tipo de nineracao apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipomineracao
      @tipomineracao = Tipomineracao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipomineracao_params
      params.require(:tipomineracao).permit(:descricao, :sigla)
    end
end
