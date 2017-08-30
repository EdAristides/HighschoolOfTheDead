class AddTurmaToAlunos < ActiveRecord::Migration
  def change
    add_reference :alunos, :turma, index: true, foreign_key: true
  end
end
