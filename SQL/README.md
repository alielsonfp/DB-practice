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
```

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
```
**Explicação:**

- `id INT`: Identificador único para cada destino.
- `nome VARCHAR(255) NOT NULL`: Nome do destino, obrigatório.
- `descricao VARCHAR(255) NOT NULL`: Descrição do destino, obrigatória.

### Criação da Tabela reservas

```sql
CREATE TABLE viagens.reservas (
   id INT COMMENT 'Identificador único da reserva',
   id_usuario INT COMMENT 'Referência ao ID do usuário que fez a reserva',
   id_destino INT COMMENT 'Referência ao ID do destino da reserva',
   data DATE COMMENT 'Data da reserva',
   status VARCHAR(255) DEFAULT 'pendente' COMMENT 'Status da reserva (confirmada, pendente, cancelada, etc)'
);
```

**Explicação:**

- `id INT`: Identificador único da reserva.
- `id_usuario INT`: Referência ao ID do usuário que fez a reserva.
- `id_destino INT`: Referência ao ID do destino da reserva.
- `data DATE`: Data da reserva.
- `status VARCHAR(255) DEFAULT 'pendente'`: Status da reserva, com valor padrão 'pendente'.

### Inserindo Usuários

```sql
INSERT INTO viagens.usuarios (id, nome, email, data_nascimento, endereco) VALUES 
(1, 'João Silva', 'joao@example.com', '1990-05-15', 'Rua A, 123, Cidade X, Estado Y'),
(2, 'Maria Santos', 'maria@example.com', '1985-08-22', 'Rua B, 456, Cidade Y, Estado Z'),
(3, 'Pedro Souza', 'pedro@example.com', '1998-02-10', 'Avenida C, 789, Cidade X, Estado Y');
```

### Inserindo Destinos

```sql
INSERT INTO viagens.destinos (id, nome, descricao) VALUES 
(1, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino'),
(2, 'Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
(3, 'Cidade Histórica de Pedra Alta', 'Uma cidade rica em história e arquitetura');
```

### Inserindo Reservas
```sql
INSERT INTO viagens.reservas (id, id_usuario, id_destino, data, status) VALUES 
(1, 1, 2, '2023-07-10', 'confirmada'),
(2, 2, 1, '2023-08-05', 'pendente'),
(3, 3, 3, '2023-09-20', 'cancelada');
```

### Atualizando e Excluindo Dados

#### Atualizando um Usuário

```sql
UPDATE viagens.usuarios
SET endereco = 'Rua D, 987, Cidade Z, Estado W'
WHERE id = 1;
```

#### Excluindo um Usuário
```sql
DELETE FROM viagens.usuarios
WHERE id = 1;
```

#### Inserindo Usuário Novamente
```sql
INSERT INTO viagens.usuarios (id, nome, email, data_nascimento, endereco) VALUES 
(1, 'João Silva', 'joao@example.com', '1990-05-15', 'Rua A, 123, Cidade X, Estado Y');
```
### Alterando o Tamanho de uma Coluna na Tabela

Se você deseja fazer uma alteração na tabela `usuarios` para aumentar o tamanho da coluna `endereco`, que foi definida inicialmente com um tamanho menor, você pode usar o seguinte código SQL:

```sql
ALTER TABLE usuarios MODIFY COLUMN endereco VARCHAR(150);
```

Este comando irá modificar a definição da coluna `endereco` na tabela `usuarios`, alterando o tipo de dados para `VARCHAR(150)`, permitindo assim que o campo possa conter até 150 caracteres. Isso é útil quando você precisa aumentar o espaço disponível para armazenar dados em uma coluna que pode ter sido definida inicialmente com um tamanho insuficiente.

### Chaves Primárias e Estrangeiras em Bancos de Dados Relacionais

**Chave Primária (Primary Key):**
- A chave primária é um campo (ou um conjunto de campos) que identifica de forma única cada registro em uma tabela.
- Ela garante a integridade dos dados, evitando registros duplicados.
- Além disso, é comumente usada como referência por outras tabelas (através de chaves estrangeiras) para estabelecer relacionamentos entre elas.
- 
  ### Adicionando Chaves Primárias

Este trecho de código SQL adiciona chaves primárias às tabelas `usuarios`, `destinos` e `reservas`. Uma chave primária é essencial em uma tabela, pois garante que cada linha tenha uma identificação única.

```sql
-- Tabela "usuarios"
ALTER TABLE usuarios
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);

-- Tabela "destinos"
ALTER TABLE destinos
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);

-- Tabela "reservas"
ALTER TABLE reservas
MODIFY COLUMN id INT AUTO_INCREMENT,
ADD PRIMARY KEY (id);
```

**Chave Estrangeira (Foreign Key):**
- A chave estrangeira é um campo (ou um conjunto de campos) em uma tabela que estabelece uma relação com a chave primária de outra tabela.
- Ela é usada para garantir a integridade referencial, garantindo que os valores em uma tabela filha correspondam aos valores existentes na tabela pai.
- As chaves estrangeiras são utilizadas para estabelecer relações entre tabelas, permitindo consultas que envolvem dados de múltiplas tabelas e garantindo a consistência dos dados.

### Adicionando Chaves Estrangeiras

Este trecho de código SQL altera a restrição da chave estrangeira "fk_reservas_usuarios" na tabela "reservas" para a opção "ON DELETE CASCADE". Quando uma linha na tabela pai (usuarios) é excluída, todas as linhas correspondentes na tabela filha (reservas) também serão excluídas automaticamente.

```sql
-- Alterando a restrição da chave estrangeira "fk_reservas_usuarios" na tabela "reservas" para ON DELETE CASCADE
ALTER TABLE reservas
DROP FOREIGN KEY fk_reservas_usuarios;

ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_usuarios
FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
ON DELETE CASCADE;
```

Isso garante a integridade referencial dos dados, removendo automaticamente as reservas associadas quando um usuário é excluído.



