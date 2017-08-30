class CreateTurmas < ActiveRecord::Migration
  def change
    create_table :turmas do |t|
      t.integer :codigo
      t.string :nome

      t.timestamps null: false
    end
  end
end
