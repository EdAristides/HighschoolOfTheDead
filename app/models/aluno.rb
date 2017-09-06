class Aluno < ActiveRecord::Base
	validates_uniqueness_of :matricula, message: ": Matrícula já cadastrado"

	validates_presence_of :cpf, message: ": O CPF deve ser preenchido"

	validates_presence_of :nome, message: ": O Nome deve ser preenchido"

	validates_presence_of :email, message: ": O E-mail deve ser preenchido"

	validates_presence_of :telefone, message: ": O Telefone deve ser preenchido"

	validates_size_of :nome, :minimum => 3, :maximun=>50, message:
		"Muito pequeno ou muito grande, mÌnimo de 3 e máximo de 50 caracteres"

	mount_uploader :foto, FotoAlunoUploader

	belongs_to :turma, required: true
end
