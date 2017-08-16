class CreateAlunos < ActiveRecord::Migration
  def change
    create_table :alunos do |t|
      t.string :matricula
      t.string :cpf
      t.string :nome
      t.string :email
      t.string :telefone
      t.date :dtmatricula
      t.date :dtnascimento

      t.timestamps null: false
    end
  end
end
