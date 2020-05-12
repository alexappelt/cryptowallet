class MoedasController < ApplicationController
  before_action :set_moeda, only: [:show, :edit, :update, :destroy]
  before_action :set_mining_type_options, only: [:edit, :new , :update , :create]

  # GET /moedas
  # GET /moedas.json
  def index
    @moedas = Moeda.all
  end

  # GET /moedas/1
  # GET /moedas/1.json
  def show
  end

  # GET /moedas/new
  def new
    @moeda = Moeda.new
    @moeda.imagem = ''
  end

  # GET /moedas/1/edit
  def edit
  end

  # POST /moedas
  # POST /moedas.json
  def create

    @moeda = Moeda.new(moeda_params)

    respond_to do |format|
      if @moeda.save
        format.js {render :js => "alert('Hello Rails');"}
        format.html { redirect_to @moeda , notice: 'Moeda foi criada com sucesso.'  }
        format.json { render :show, status: :created, location: @moeda }

      else
        format.html { render :new }
        format.json { render json: @moeda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moedas/1
  # PATCH/PUT /moedas/1.json
  def update
    respond_to do |format|
      if @moeda.update(moeda_params)
        @classe_sucess = 'alert alert-success'
        format.html { redirect_to @moeda, notice: 'Moeda foi atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @moeda }
      else
        format.html { render :edit }
        format.json { render json: @moeda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moedas/1
  # DELETE /moedas/1.json
  def destroy
    @classe_sucess = 'alert alert-success'
    @moeda.destroy
    respond_to do |format|
      format.html { redirect_to moedas_url, notice: 'Moeda foi apagada com sucesso.' , class:"alert alert-success" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moeda
      @moeda = Moeda.find(params[:id])
    end

  def set_mining_type_options
    @mining_type_options = Tipomineracao.all.pluck(:descricao, :id);
  end

    # Only allow a list of trusted parameters through.
    def moeda_params
      params.require(:moeda).permit(:descricao, :sigla, :imagem , :tipomineracao_id)
    end
end
