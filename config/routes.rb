Rails.application.routes.draw do
  devise_for :usuarios
  resources :professores
  resources :alunos
  resources :turmas
  get 'paginas/index'
  root :to => 'paginas#index'
end
