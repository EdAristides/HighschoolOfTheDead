class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]

  # GET /alunos
  # GET /alunos.json
  def index
    # buscar o sexo
   
    @psexo = params[:psexo]
    # buscar o nome
    @pnome = params[:pnome]

    filtro = "1=1"
    
    if  @psexo ==  "M"
      filtro = filtro + " and sexo = 'M' "
    end
    if  @psexo ==  "F"
      filtro = filtro + " and sexo = 'F' "
    end

    if not(@pnome.nil?)
       filtro = filtro + " and nome like '%"+@pnome+"%'"
    end

    @alunos = Aluno.where(filtro).order("nome").paginate(page: params[:page], per_page: 3)
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
  end

  # GET /alunos/new
  def new
    @aluno = Aluno.new
  end

  # GET /alunos/1/edit
  def edit
  end

  # POST /alunos
  # POST /alunos.json
  def create
    @aluno = Aluno.new(aluno_params)

    respond_to do |format|
      if @aluno.save
        format.html { redirect_to @aluno, notice: 'Registro do aluno criado com sucesso.' }
        format.json { render :show, status: :created, location: @aluno }
      else
        format.html { render :new }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alunos/1
  # PATCH/PUT /alunos/1.json
  def update
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to @aluno, notice: 'Registro do aluno atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
    @aluno.destroy
    respond_to do |format|
      format.html { redirect_to alunos_url, notice: 'Registro do aluno deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_params
      params.require(:aluno).permit(:matricula, :cpf, :nome, :email, :telefone, :dtmatricula, :dtnascimento, :sexo, :foto, :turma_id)
    end
end
