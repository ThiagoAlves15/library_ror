# Desafio técnico Ruby on Rails

Uma biblioteca de uma grande cidade está com dificuldades de organizar as reservas de seus livros, hoje todo o controle é feito manualmente, para saber os livros mais reservados levaria um tempo de pesquisa nos livros de reserva. Então a biblioteca teve uma ideia de montar um sistema de reservas, com o requisitos:

## Administrador (bibliotecário) pode:

 - Cadastrar novos livros; OK
 - Pesquisar todos os livros, podendo filtrar por cada detalhe e retorno com paginação;
 - Editar os livros existentes; OK
 - Remover os livros existentes; OK
 - Cadastrar novos usuários, sendo comum ou novos administradores;
 - Criar uma nova reserva, entre livro e usuário comum;
 - Pesquisar todas as reservas, podendo filtrar por cada detalhe e retorno com paginação;
 - Finalizar uma reserva.

## Usuário pode:

 - Visualizar todos os livros, podendo filtrar por cada detalhe e retorno com paginação;
 - Criar uma reserva;
 - Visualizar suas reservas, podendo filtrar por cada detalhe e retorno com paginação.

## O usuário deve possuir os detalhes:
 - Nome
 - Email
 - Senha
 - Permissão

## Os livros devem possuir os detalhes:
 - Titulo
 - Autor
 - Categoria
 - Data de cadastro e alteração

## As reservas devem possuir os detalhes:
 - Livro
 - Usuário
 - Data da reserva
 - Data de devolução
 - Status da reserva

Seu papel será montar todo o Backend/Frontend para esse sistema, garantindo a cobertura de testes e integridade da aplicação, utilizando Ruby on Rails e PostgreSQL para persistir os dados.

## Dicas/Requisitos:
 - Crie testes de ponta a ponta (E2E) garantindo o funcionamento do projeto.
 - Comente tudo o que fizer, para que outros devs entendam o que você fez.
 - Utilize tema (bootstrap ou de sua escolha) para uma boa visualização e experiência ao cliente/usuário final.
 - Utilize Gitflow para manter o versionamento entre as ramificação de features/hotfix/bugfix.
 - Suba seu código no git e nos envie o resultado.