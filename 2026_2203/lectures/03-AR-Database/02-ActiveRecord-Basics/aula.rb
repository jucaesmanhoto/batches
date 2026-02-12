####################
##   DISCLAIMER   ##
####################
# Não se preocupe em absorver tudo!
# O material continuará no kitt para referências futuras.
# Sempre que precisar pesquise, consulte o kitt, copie e cole
# O objetivo da aula é APRESENTAR os conceitos básicos e
# mostrar um pouco o porquê das coisas.
# O aprendizado virá na pratica contínua. Ninguém fica musculoso no primeiro treino!
# Se ficar qquer dúvida, por favor PERGUNTE!



##############################
##   ACTIVE RECORD BASICS   ##
##############################

#   ORM (Object-Relational Mapping ou Mapeamento Objeto-Relacional)
# é uma técnica de desenvolvimento que
# ABSTRAI a INTERAÇÃO com bancos de dados RELACIONAL,
# permitindo que programadores manipulem dados
# utilizando OBJETOS e CLASSES da sua linguagem de programação,
# ao invés de escrever SQL manualmente.
#   Ele atua como uma ponte, aumentando a produtividade e facilitando a manutenção.

# https://guides.rubyonrails.org/active_record_basics.html



####################
##   RAKE TASKS   ##
####################

# Lista todas as tasks
# rake -T

# # Cria o banco de dados !!!SEM ESTRUTURA ALGUMA!!!
# rake db:create
# ll db # => lista os arquivos da pasta db

# # Apaga o banco de dados !!!!PERIGO!!!
# rake db:drop
# ll db # => lista os arquivos da pasta db



####################
##   MIGRATIONS   ##
####################

## DB Schema sandbox:
# https://kitt.lewagon.com/db

## Migration para ???
# class QueNomeDaremos??? < ActiveRecord::Migration[8.1]
#   def change
#     create_table :movies do |t|
#       t.string    :title
#       t.integer   :year

#       t.timestamps # => created_at e updated_at
#     end
#   end
# end

## Para rodar as migrações pendentes:
# rake db:migrate

# Como ordenar as migrações???
# rake db:timestamp

## Migration para ???
# class QueNomeDaremos??? < ActiveRecord::Migration[8.1]
#   def change
#     add_column :movies, :rating, :integer, default: 0, null: false
#   end
# end

# Conferindo a estrutura do banco (schema):
# sqlite3 db/development.sqlite3

# sqlite> .schema
# sqlite> .mode column
# sqlite> .headers on
# sqlite> SELECT * FROM schema_migrations;



###############
##   MODEL   ##
###############

## Como criamos o modelo para um filme?
class OldSchoolMovie
end
class Movie < ActiveRecord::Base
end

## Irb turbinado com o contexto?
# rake console

## Convenção sobre configuração
## Plurais e singulares não são negociáveis!

# Classes (UpperCamelCase):
# (M) Model       => plural ou singular? Pq?
# (V) View        => plural ou singular? Pq?
# (C) Controller  => plural ou singular? Pq?

# Tabelas e arquivos (lower_snake_case):
# db_tables => plural ou singular? Pq?
# project_files => plural ou singular? Pq?

## ORM
# object(modelo) <==> relational(tabela)



###########################
##   UNLEASH THE MAGIC   ##
###########################

# rake console

# Criando um filme na época do repository:

# # 1. Criar as instâncias no controller
pulp_fiction = Movie.new(
  title: "Pulp Fiction",
  year: 1994
)
# # 2. Chamar o método create no repositório
# @movie_repository.create(pulp_fiction)
# # 3. Executar o save_csv (método privado do repositório)
# save_csv

## Criando um filme com ActiveRecord:
## 1. Criar a instância
# pulp_fiction = Movie.new(
#   title: "Pulp Fiction",
#   year: 1994
# )
## 2. Salvar no banco de dados
## => INSERT INTO "movies" ("title", "year") VALUES ('Pulp Fiction', 1994)
# pulp_fiction.save

## => Salvar no banco o "E.T. the Extra-Terrestrial" de 1982
## => Salvar no banco o "Good Will Hunting" de 1997
## => Salvar no banco o "Gone Girl" de 2014
## Buscar todos os filmes gravados no banco de dados?
## => SELECT * FROM movies;
# movies = ???
# movies.class # => ???

## Saber quantos filmes temos registrados no banco de dados?
## => SELECT COUNT(*) FROM movies;
# ???

## Procurando as informações um filme específico?
## => SELECT * FROM movies WHERE id = 1;
# movie = ???
# movie.??? => "Pulp Fiction"
# movie.??? => "https://www.imdb.com/title/tt0110912"

## Precisa atualizar um filme?
## UPDATE movies SET rating = 5 WHERE id = 1;
# movie = ???
# ???
# ???

## Quer apagar um filme da lista?
## DELETE FROM movies WHERE id = 1;
# pulp_fiction = ???
# pulp_fiction.???

## Precisa filtrar os filmes por um atributo (p.exp.: rating == 5)
## SELECT * FROM movies WHERE rating = 5;
# perfect_movies = ???
# perfect_movies.class # => ???

## Precisa filtrar os filmes por uma parte do atributo (p.exp.: 'pulp')
## SELECT * FROM movies WHERE title LIKE '%ulp%';
# perfect_movies = ???
# perfect_movies.class # => ???

## Quer encontrar um filme específico pelo nome? (ou qquer outro atributo)
## SELECT * FROM moviews WHERE title = 'Pulp Fiction' LIMIT 1;
# pulp_fiction = ???

## Quer recuperar as informações do primeiro ou do último filme adicinado no DB?
## => Utiliza o id (primary key) da tabela
# ???
# ???



###############
##   SEEDS   ##
###############

# Pra que serve?
# Imagina se o time do AirBnb tivesse que cadastrar
# um imóvel de cada tipo na mão, um de cada vez
# com todas as informações só pra fazer um protótipo do site?

## Boas práticas:
## 1. Sempre comece limpando o banco de dados, para poder rodar várias vezes
## 2. Inclua as instâncias necessárias, respeitando a ordem das dependências (futuro)
## 3. Inclua mensagens que te ajudem a entender qual parte do seed está sendo executado

## EXEMPLO:

# #db/seeds.rb
# puts 'Cleaning...'
# Movie.destroy_all

# puts 'Creating movies'
# pulp_fiction = Movie.new(
#   title: "Pulp Fiction",
#   year: 1994
# )
# puts "Saving #{pulp_fiction.title}"
# pulp_fiction.save

# puts "#{Movie.count} movie(s) were created."



###############
##   FAKER   ##
###############

## Instalando a gem
## https://github.com/faker-ruby/faker
# gem install faker

# #db/seeds.rb
# require 'faker'

# puts "Cleaning the mess before start..."
# Movie.destroy_all

# puts "Creating 100 fake movies..."
# 100.times do
#   movie = Movie.new(
#     title:  Faker::Coffee.unique.blend_name,
#     year: rand(1950..2026)
#   )
#   puts "Saving fake movie #{movie.title}"
#   movie.save! # => raise error
# end

# puts "#{Movie.count} fake movies were sucessfully created."



####################
##   CHALLENGES   ##
####################

# Se não souberem como começar, o rake está lá pra te dar um empurrãozinho!... ;)

# Não entendeu algo, pergunta pro seus buddies
# Se seu/sua buddy está com dúvida em um ponto que vc já passou, ajudar eles a destravar é a melhor forma de fixar ainda melhor o conhecimento
# Mas se eles estiverem com o mesmo problema, ou ainda não chegaram lá:
# Abre um ticket!

# Objetivos principais
# 1. Generate DB
# => Entender o que as tasks do rake fazem e usar a correta para criar o DB

# 2. Migrations
# => Entender a diferença entre registros e estrutura do banco de dados e a qual desses dois as migrações estão relacionadas

# 3. Models
# => Se familiarizar com alguns comandos do ActiveRecord
# Entender a importância da correta utilização das convenções
# Foi melhor/mais fácil do que escrever o SQL na mão?

# 4. Seed Faker
# 5. Seed API
# => Qual a importância e como escrever um script para popular os dados iniciais em um projeto.
# Entender a importância de não usar o id como referência "fixa", já que ele muda a cada vez que vc roda o seed.

######################
##   Divirtam-se!   ##
######################



















 Movie.where("title LIKE ?", ["%ulp%"])
