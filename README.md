# Sistema de Gestão de Haras

Este projeto implementa um banco de dados MySQL para um **Sistema de Gestão de Haras**, desenvolvido como trabalho da disciplina de Banco de Dados.

O sistema permite o gerenciamento das principais informações de um haras, incluindo:

* cadastro de cavalos;
* cadastro de raças;
* cadastro de clientes;
* cadastro de funcionários e cargos;
* registro de vendas;
* controle da ocupação das baias;
* histórico de movimentação dos cavalos entre as baias.

Além disso, o projeto utiliza **Views** e **Triggers** para facilitar consultas e garantir regras de negócio, como impedir a venda de cavalos já vendidos ou com status de óbito.

---

# Configuração do Banco de Dados

* **SGBD:** MySQL 8.1
* **Banco de dados:** `mydb`
* **Usuário:** `root`
* **Senha:** `admin`
* **Container Docker:** `meubanco`

---

# Estrutura do Projeto

```
bd-banco/
├── consultas/
│   ├── 4_visao1.sql
│   └── 4_visao1.md
│
├── scripts/
│   ├── 1_esquema.sql
│   ├── 2_populacao.sql
│   ├── 3_trigger.sql
│   ├── 3_trigger.md
│   └── 3_triggerAtivado.sql
│
├── inicializar/
├── dados/
├── docker-compose.yml
├── README.md
└── .gitignore
```

### Organização das pastas

* **consultas/** → contém as views e sua documentação.
* **scripts/** → contém os scripts do banco de dados, incluindo esquema, população e trigger.
* **dados/** → armazena os dados persistentes do MySQL.
* **inicializar/** → scripts executados apenas na primeira inicialização do container.
* **docker-compose.yml** → configuração do ambiente Docker.

---

# Inicializando o Banco

Para iniciar o container execute:

```bash
docker-compose up -d
```

Depois acesse o MySQL:

```bash
docker exec -it meubanco mysql -u root -p
```

Quando solicitado, informe a senha:

```
admin
```

Em seguida selecione o banco de dados:

```sql
USE mydb;
```

---

# Executando os Scripts

Caso o banco ainda não esteja criado, execute os scripts na seguinte ordem:

```sql
SOURCE ./scripts/1_esquema.sql;
```

```sql
SOURCE ./scripts/2_populacao.sql;
```

```sql
SOURCE ./scripts/3_trigger.sql;
```

```sql
SOURCE ./consultas/4_visao1.sql;
```

---

# Comandos Úteis

Selecionar o banco:

```sql
USE mydb;
```

Listar todas as tabelas:

```sql
SHOW TABLES;
```

Mostrar a estrutura de uma tabela:

```sql
DESCRIBE cavalo;
```

Visualizar todos os registros:

```sql
SELECT * FROM cavalo;
```

Consultar as views existentes:

```sql
SHOW FULL TABLES WHERE Table_type = 'VIEW';
```

Executar a view criada:

```sql
SELECT * FROM vw_baia_ocupacao_atual;
```

Visualizar os gatilhos cadastrados:

```sql
SHOW TRIGGERS;
```

---

# Testando a Trigger

Para executar o teste preparado no projeto:

```sql
SOURCE ./scripts/3_triggerAtivado.sql;
```

Também é possível realizar uma venda manualmente:

```sql
INSERT INTO venda (
    data_venda,
    valor,
    cliente_id_cliente,
    cavalo_id_cavalo,
    funcionario_id_funcionario
)
VALUES (
    NOW(),
    50000.00,
    @id_cliente_teste,
    @id_cavalo_teste,
    @id_funcionario_teste
);
```

A trigger verifica automaticamente o status do cavalo. Caso ele já tenha sido vendido ou esteja com status **Óbito**, a operação será cancelada e uma mensagem de erro será exibida.

---

# Encerrando o Ambiente

Parar o container:

```bash
docker-compose down
```

Parar o container e remover os volumes:

```bash
docker-compose down -v
```

Caso seja necessário remover completamente os dados persistentes, a pasta `dados/` poderá ser excluída manualmente.
