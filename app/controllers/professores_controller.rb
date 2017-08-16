class ProfessoresController < ApplicationController
  before_action :set_professore, only: [:show, :edit, :update, :destroy]

  # GET /professores
  # GET /professores.json
  def index
    @professores = Professore.all
  end

  # GET /professores/1
  # GET /professores/1.json
  def show
  end

  # GET /professores/new
  def new
    @professore = Professore.new
  end

  # GET /professores/1/edit
  def edit
  end

  # POST /professores
  # POST /professores.json
  def create
    @professore = Professore.new(professore_params)

    respond_to do |format|
      if @professore.save
        format.html { redirect_to @professore, notice: 'Professore was successfully created.' }
        format.json { render :show, status: :created, location: @professore }
      else
        format.html { render :new }
        format.json { render json: @professore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professores/1
  # PATCH/PUT /professores/1.json
  def update
    respond_to do |format|
      if @professore.update(professore_params)
        format.html { redirect_to @professore, notice: 'Professore was successfully updated.' }
        format.json { render :show, status: :ok, location: @professore }
      else
        format.html { render :edit }
        format.json { render json: @professore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professores/1
  # DELETE /professores/1.json
  def destroy
    @professore.destroy
    respond_to do |format|
      format.html { redirect_to professores_url, notice: 'Professore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professore
      @professore = Professore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professore_params
      params.require(:professore).permit(:siape, :cpf, :nome, :email, :telefone, :dtnascimento)
    end
end
