class AddFotoToProfessores < ActiveRecord::Migration
  def change
    add_column :professores, :foto, :string
  end
end
