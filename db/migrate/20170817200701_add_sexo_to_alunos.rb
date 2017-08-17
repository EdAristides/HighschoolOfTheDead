class AddSexoToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :sexo, :string
  end
end
