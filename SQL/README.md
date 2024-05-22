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
