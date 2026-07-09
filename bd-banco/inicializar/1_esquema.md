# Esquema do Banco de Dados

O banco de dados foi desenvolvido para gerenciar as principais atividades de um haras, como o cadastro de cavalos, clientes, funcionários, vendas e ocupação das baias. O esquema foi modelado de forma relacional, utilizando chaves primárias e estrangeiras para garantir a integridade dos dados.

## Tabelas

### raca

Armazena as informações das raças dos cavalos, contendo o nome da raça e sua classificação por porte (Pequeno, Médio ou Grande). Essa tabela evita a repetição dessas informações para cada cavalo cadastrado.

### cavalo

Contém os dados de cada cavalo do haras, como nome, sexo, origem, status, data de nascimento, cor, peso e altura. Também possui relacionamentos com a tabela **raca** e referências para o pai e a mãe do animal, permitindo representar sua genealogia.

### pessoa

Centraliza os dados pessoais utilizados tanto para clientes quanto para funcionários, armazenando CPF, nome e telefone. Essa estrutura evita duplicação de informações.

### cliente

Representa os clientes do haras. Cada cliente está associado a um registro da tabela **pessoa**, reutilizando seus dados cadastrais.

### cargo

Armazena os cargos existentes no haras, como Veterinário, Tratador e Gerente. Essa separação facilita o gerenciamento e evita repetição de cargos.

### funcionario

Armazena os funcionários do haras, registrando seu salário e relacionando cada funcionário a uma pessoa cadastrada e a um cargo.

### venda

Registra todas as vendas realizadas, armazenando a data da venda, o valor negociado, o cliente comprador, o cavalo vendido e o funcionário responsável pela negociação.

### baia

Representa as baias do haras, contendo seu número, tamanho e situação (Livre ou Ocupada).

### baia_historico

Armazena o histórico de ocupação das baias. Cada registro informa qual cavalo ocupou determinada baia, a data de entrada e, quando aplicável, a data de saída. Dessa forma, é possível consultar tanto a ocupação atual quanto todo o histórico de movimentações.

## Relacionamentos

O esquema utiliza chaves estrangeiras para manter a integridade referencial entre as tabelas.

* Um cavalo pertence a uma raça.
* Um cavalo pode possuir referências para seu pai e sua mãe, ambos cadastrados na própria tabela de cavalos.
* Um cliente está associado a uma pessoa.
* Um funcionário está associado a uma pessoa e a um cargo.
* Uma venda relaciona um cliente, um funcionário e um cavalo.
* O histórico de baias relaciona cada cavalo à baia ocupada durante um determinado período.

## Organização do Modelo

A modelagem foi construída seguindo os princípios da normalização, reduzindo redundâncias e facilitando a manutenção do banco de dados. A utilização de chaves primárias, chaves estrangeiras e restrições de unicidade garante a consistência das informações e permite que consultas, visões (views) e gatilhos (triggers) sejam implementados de forma eficiente.
