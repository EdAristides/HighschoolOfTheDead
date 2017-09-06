class ProfessoresController < ApplicationController
  before_action :set_professore, only: [:show, :edit, :update, :destroy]

  # GET /professores
  # GET /professores.json
  def index
    # buscar o nome
    @pnome = params[:pnome]

    filtro = "1=1"

    if not(@pnome.nil?)
       filtro = filtro + " and nome like '%"+@pnome+"%'"
    end

    @professores = Professore.where(filtro).order("nome").paginate(page: params[:page], per_page: 3)
  end

  def listar
    @professores = Professore.all.paginate(page: params[:page], per_page: 10)
    
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ProfessoresReport.new(@professores)
        send_data pdf.render, filename: 'ProfessoresListagem.pdf', :width => pdf.bounds.width,
        type: 'application/pdf', disposition: :inline, :page_size => "A4", :page_layout => :portrait
      end
    end
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
        format.html { redirect_to @professore, notice: 'Registro do professor criado com sucesso.' }
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
        format.html { redirect_to @professore, notice: 'Registro do professor atualizado com sucesso.' }
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
      format.html { redirect_to professores_url, notice: 'Registro do professor deletado com sucesso.' }
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
      params.require(:professore).permit(:siape, :cpf, :nome, :email, :telefone, :dtnascimento, :sexo, :foto)
    end
end
