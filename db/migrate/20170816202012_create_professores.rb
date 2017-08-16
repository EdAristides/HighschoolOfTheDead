class CreateProfessores < ActiveRecord::Migration
  def change
    create_table :professores do |t|
      t.string :siape
      t.string :cpf
      t.string :nome
      t.string :email
      t.string :telefone
      t.date :dtnascimento

      t.timestamps null: false
    end
  end
end
