class Turma < ActiveRecord::Base
	validates_uniqueness_of :codigo, message: ": Código já cadastrado"

	validates_presence_of :nome, message: ": O Nome deve ser preenchido"
end
