# Big City Library reservation system

## Setup local

Ruby versão 3.1.2

`bundle i`

`echo 'export DATABASE_USERNAME="yourdbuser"' >> ~/.bashrc`

`echo 'export DATABASE_PASSWORD="yourdbpassword"' >> ~/.bashrc`

`rails db:create && rails db:migrate`

`rails s`

## Utilização de gems

 - Devise como ferramenta de autenticação;
 - CanCanCan como ferramenta de permissão;
 - Kaminari como ferramenta de paginação;
 - Rspec, Factory bot, Faker e Simplecov como ferramentas de testes;
 - Bootstrap como ferramenta de tema;
 - Gem Paranoia para garantir integridade dos dados excluídos;
 - Rubocop como ferramenta de lint;

## Modo de uso

 - Para logar como administrador, use a conta de email "admin@admin.com" e senha "adminadmin";
 - A visualização do administrador é baseada em um CRUD básico;
 
 ## Todo

 - Adicionar o Active Storage para imagens de capa de livros e avatar do usuário;
 - Aprimorar sistema de busca;
 - Admin pode visualizar itens que foram soft deleted;
