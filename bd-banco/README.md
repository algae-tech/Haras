# Entenda o projeto

Este projeto executa um banco de dados MySQL 8.1 usando Docker. Embora possamos executar o nosso SGBD instalando-o diretamente em nossos computadores, essa abordagem é bastante vantajosa, pois:

- podemos migrar de um computador para outro com facilidade, mantendo as configurações do banco de dados, como dados de `login` e `senha`;
- o banco de dados pode ser executado diretamente pelo browser, via Github Codespaces, como veremos em aula;

## Hierarquia de pastas do projeto

Nosso projeto está organizado na seguinte hierarquia de pastas: 

mysql-docker/
├── dados/                  # para armazenar o SGBD
│   └── mysql/
├── inicializar/                   # scripts aplicados só na primeira inicialização
│   └── 01_backup.sql       # backup exportado
├── scripts/                # scripts manuais 
├── docker-compose.yml
└── .gitignore

Entendendo a estrutura:

- `dados/mysql/` → mantém os dados persistentes do MySQL;  
- `inicializar/` → scripts SQL que serão executados apenas na **primeira inicialização** do container com volume vazio;  
- `scripts/` → scripts que podem ser executados manualmente a qualquer momento;  
- `docker-compose.yml` → arquivo de configuração do Docker;  
- `.gitignore` → para ignorar arquivos que não devem ser versionados.

## Comandos importantes

### Inicializando o container

Primeiro, precisamos inicializar o container:

```bash
docker-compose up -d
```

Depois, podemos acessar a Command Line Interface (CLI) do MySQL, usando o seguinte comando:

```
docker exec -i meubanco mysql -u root
```

Se não funcionar (ocorre de vez em quando no Windows), precisamos passar o caminho do host:

```
docker exec -it meubanco mysql -h 127.0.0.1 -P 3306 -u root -p
```

Agora, teremos acesso às operações SQL rodando diretamente do nosso container, chamado `meubanco`. 

### Manipulando o banco

Para manipularmos o banco, além dos próprios comandos na CLI do MySQL, podemos também criar scripts próprios na pasta `scripts`. Depois, para executá-los, apenas chamamos da seguinte forma:

```sql
SOURCE ./scripts/arquivo.sql
```

### Fazendo backup dos dados

A pasta `dados` do nosso projeto armazena toda a instalação do `MySQL`. Se continuarmos no mesmo computador, sem problemas: os dados gerados continuarão ali. No entanto, se usarmos o Github para o gerenciamento do projeto, essa abordagem pode não ser adequada. 

```bash
docker exec -i meubanco mysqldump -u root -padmin --all-databases > ./scripts/backup.sql
```

### Encerrando

Para finalizar, podemos executar o seguinte comando:

```
docker-compose down
```

Para remover também os volumes e limpar todos os dados persistentes no container, use:

```
docker-compose down -v
```

No caso acima, a pasta na máquina local deve ser excluída manualmente.