# BankAPI
API para criacao de contas bancarias e transacoes.

## Desafio
Criar um sistema de gestão bancária por meio de uma API, composta
por dois endpoints: "/conta" e "/transacao". O endpoint "/conta" deve
criar e fornecer informações sobre o número da conta. O endpoint "/transacao" será responsável por realizar diversas operações
financeiras.

## Rubocop

A parte desenvolvida para solucionar esse desafio está seguindo um padrão mínimo definido no RuboCop afim de evitar espaços desnecessários, códigos verbosos e definir uma padronização de código entre uma squad de desenvolvimento, e assim, evitando que cada um siga seu próprio padrão dentro de uma equipe.



## Feito com
![Rails][Rails]![Rspec][Rspec]![PostgreSQL][PostgreSQL]![Docker][Docker]![Rswag][Rswag]

### Dependências

* Rails 7.1.3
* Ruby 3.3.0
* PostgreSQL
* Docker



## Executando a aplicação

### Local
#### Build

```
cp .env.example .env
rails db:create
rails db:migrate
```
#### Rodar na porta 3000

```
rails s
```

#### Rodar testes

```
rspec
```

### Docker
#### Build

```
docker compose build
docker compose up -d

docker compose run web rails db:create db:migrate
```
#### Rodar testes
```
docker compose run web rspec
```

### Documentacao

```
locahost:3000/api-docs
```

### Possiveis melhorias
Essa entrega se ateve aos requisitos mínimos para atender ao escopo de desafio.
Para algo mais abragente poderia usar transactions para garantir a integridade dos dados, e tambem implementar um sistema de autenticacao para garantir a seguranca da aplicacao, 
poderia tambem ser implementado job assincrono para processar as transacoes, e tambem implementar um sistema de notificacao para o usuario, e implementar um sistema de logs para monitorar a aplicacao.


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[Rails]: https://img.shields.io/badge/Rails-a40000?style=for-the-badge&logo=RubyonRails&logoColor=white
[PostgreSQL]: https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=PostgreSQL&logoColor=white
[Docker]: https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=Docker&logoColor=white
[Rswag]: https://img.shields.io/badge/Rswag-85C7F2?style=for-the-badge&logo=Swagger&logoColor=white
[Rspec]: https://img.shields.io/badge/Rspec-FF3E00?style=for-the-badge&logo=Rspec&logoColor=white
