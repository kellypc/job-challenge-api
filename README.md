# README

# Caiena Challenger Api

Desafio:
Este é um desafio proposto pela empresa Caiena.
Nesse projeto iremos fazer uma api para criação de tweets, onde será informada a previsão de tempo para uma cidade que o usuário solicitar. Além de fornecermos a previsão para os próximos cinco dias.



O desafio é um projeto desenvolvido em ruby on rails e conta o auxílio de algumas gems:
open_weather_map
twitter
Rspec
Simplecov
Rubocop - a ser implementado
Docker - a ser implementado
Dotenv-rails

## Tabela de Conteúdo

- [Instalação](#instalacao)
- [Documentação da API](#documentacao)

## Instalação

Obs: Para esse projeto utilizei o sistema operacional MacOS Monterey.
Usei o editor de texto code.
Estamos usando a versão do Ruby 2.7.2 e rails 6.1.7. Essas versões foram usadas por terem compatibilidade com a gem do twitter.
1. Clone o projeto.

   ```sh
   $ git@github.com:kellypc/rebase-rebase-questionnaire-challenge.git
   ```

2. Configure o docker

   `docker-compose build`

3. Para desenvolvimento

   `docker-compose run --service-ports rails bash`

4. Essa api conta com testes com o rspec, para rodá-los rode no terminal.

   ```sh
   $ bundle exec rspec
   ou
   $ bundle exec rspec ./spec/users_create_questionnaire_spec.rb
   ```

5. Para manter o padrão de código ruby, temos o rubocop, para executá-lo rode no terminal para ver se há alguma ofensa a ser corrigida.

   ```sh
   $ rubocop
   ```

## Documentacão

### Criar Usuario

##### Request

```sh
POST  api/v1/usuario
```

```sh
Parameters:
{
    "user": {
        "name": "User Test",
        "email": "user@test.com",
    }
}
```

##### Response

```sh
status: 201 created
```

```sh
Content-Type: "application/json"
```

```sh
Body:
{
    "message": 'Usuário criado com sucesso'
}
```

## Listar Questionário

##### Request

```sh
GET  api/v1/questionario
```

```sh
Parameters:
{
    "questionnaire": {
        "name": "Lógica",
        "description": "É um teste",
        "limit_time": 2
    }
}
```

```sh
Body:
{
    "id": 1
    "name": "Lógica",
    "description": "É um teste",
    "limit_time": 2.0,
    "user_id": 1,
    "created_at": "2020-06-29T12:41:40.621Z",
    "updated_at": "2020-06-29T12:41:40.621Z"
}
```

### Criar Questionário

##### Request

```sh
POST  api/v1/questionario
```

```sh
Parameters:
{
    "questionnaire": {
        "name": "Lógica",
        "description": "Teste o seu conhecimento",
        "limit_time": 2
    }
}
```

##### Response

```sh
status: 201 created
```

```sh
Content-Type: "application/json"
```

```sh
Body:
{
    "message": 'Questionário criado com sucesso'
}
```

### Criar Pergunta

#### Request

```sh
POST  api/v1/pergunta
```

```sh
Parameters:
{
    "question": {
        "description": "Qual são as cores do arco-íris?",
        "points": 2
    }
}
```

##### Response

```sh
status: 201 created
```
