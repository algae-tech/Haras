# Sistema de Gestão de Haras

## Integrantes

| Lucas Gonçalves Mendonça | 202321901031 |
| Izabella Richtic Silva   | 202321901053 |

---

## Descrição do Problema

O projeto consiste no desenvolvimento de um banco de dados para um **Sistema de Gestão de Haras**, cujo objetivo é organizar e controlar as principais informações relacionadas à administração de um haras.

O sistema permite o cadastro de cavalos, armazenando informações como raça, sexo, origem, data de nascimento, características físicas, status e parentesco (pai e mãe). Também realiza o cadastro de clientes, funcionários e seus respectivos cargos.

Além disso, o sistema registra as vendas de cavalos, identificando o comprador, o funcionário responsável, o valor negociado e a data da venda. Para garantir a consistência dos dados, um cavalo não pode ser vendido mais de uma vez e também não pode ser vendido caso esteja com status de óbito.

O banco de dados também controla a ocupação das baias por meio de um histórico de movimentações, registrando as datas de entrada e saída de cada cavalo. Dessa forma, é possível consultar tanto a ocupação atual quanto o histórico completo de utilização das baias.

## Requisitos do Sistema

* Cadastrar raças de cavalos.
* Cadastrar cavalos e suas informações.
* Registrar o parentesco entre cavalos.
* Cadastrar clientes.
* Cadastrar funcionários e seus cargos.
* Registrar vendas de cavalos.
* Impedir a venda de cavalos já vendidos ou em óbito.
* Controlar a ocupação das baias.
* Manter o histórico de entrada e saída dos cavalos nas baias.
* Permitir consultas sobre cavalos, vendas e ocupação das baias.

## Restrições do Banco de Dados

* Cada pessoa possui um CPF único.
* Cada raça possui um nome único.
* Cada cargo possui um nome único.
* Toda venda deve estar associada a um cliente, um funcionário e um cavalo cadastrados.
* O histórico de baias deve estar vinculado a uma baia e a um cavalo existentes.
* Os relacionamentos entre as tabelas são garantidos por chaves estrangeiras, preservando a integridade referencial dos dados.
