class AddSexoToProfessores < ActiveRecord::Migration
  def change
    add_column :professores, :sexo, :string
  end
end
