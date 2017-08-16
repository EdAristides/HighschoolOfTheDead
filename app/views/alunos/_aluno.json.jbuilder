json.extract! aluno, :id, :matricula, :cpf, :nome, :email, :telefone, :dtmatricula, :dtnascimento, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
