Rails.application.routes.draw do
  devise_for :usuarios
  resources :alunos
  resources :turmas

  resources :professores do
    collection do
		  get :listar
    end
  end

  get 'paginas/index'
  root :to => 'paginas#index'
end
