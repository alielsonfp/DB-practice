# Conceitos Básicos de Banco de Dados SQL

Bem-vindo ao repositório sobre conceitos básicos de banco de dados SQL! Este repositório contém exemplos práticos e explicações sobre a criação e manipulação de bancos de dados. Aqui, vamos explorar comandos SQL fundamentais através da criação de um banco de dados chamado `viagens` com tabelas relacionadas.

## Introdução

Este repositório serve como um guia introdutório para quem está começando a trabalhar com bancos de dados SQL. Vamos focar em comandos SQL para criar e manipular tabelas.

## Banco de Dados SQL

Vamos criar um banco de dados chamado `viagens` e três tabelas: `usuarios`, `destinos`, e `reservas`. Cada tabela terá colunas apropriadas com comentários para facilitar a compreensão de suas finalidades.

### Criação da Tabela `usuarios`

A tabela `usuarios` armazena informações sobre os usuários do sistema.

```sql
CREATE TABLE usuarios (
    id INT,
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do usuário',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Email do usuário',
    endereco VARCHAR(50) NOT NULL COMMENT 'Endereço do usuário',
    data_nascimento DATE NOT NULL COMMENT 'Data de nascimento do usuário'
);

**Explicação:**

- `id INT`: Identificador único para cada usuário.
- `nome VARCHAR(255) NOT NULL`: Nome do usuário, obrigatório.
- `email VARCHAR(100) NOT NULL UNIQUE`: Email do usuário, obrigatório e único.
- `endereco VARCHAR(50) NOT NULL`: Endereço do usuário, obrigatório.
- `data_nascimento DATE NOT NULL`: Data de nascimento do usuário, obrigatória.

### Criação da Tabela `destinos`

A tabela `destinos` armazena informações sobre os destinos de viagem.

```sql
CREATE TABLE viagens.destinos (
    id INT,
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do Destino',
    descricao VARCHAR(255) NOT NULL COMMENT 'Descrição do Destino'
);

**Explicação:**

- id INT: Identificador único para cada destino.
- nome VARCHAR(255) NOT NULL: Nome do destino, obrigatório.
- descricao VARCHAR(255) NOT NULL: Descrição do destino, obrigatória.

### Criação da Tabela reservas

```sql
CREATE TABLE viagens.reservas (
   id INT COMMENT 'Identificador único da reserva',
   id_usuario INT COMMENT 'Referência ao ID do usuário que fez a reserva',
   id_destino INT COMMENT 'Referência ao ID do destino da reserva',
   data DATE COMMENT 'Data da reserva',
   status VARCHAR(255) DEFAULT 'pendente' COMMENT 'Status da reserva (confirmada, pendente, cancelada, etc)'
);

**Explicação:**

id INT: Identificador único da reserva.
id_usuario INT: Referência ao ID do usuário que fez a reserva.
id_destino INT: Referência ao ID do destino da reserva.
data DATE: Data da reserva.
status VARCHAR(255) DEFAULT 'pendente': Status da reserva, com valor padrão 'pendente'.
