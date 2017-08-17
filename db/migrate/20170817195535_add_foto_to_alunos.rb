class AddFotoToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :foto, :string
  end
end
