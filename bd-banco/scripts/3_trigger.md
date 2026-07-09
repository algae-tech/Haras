# Trigger – Atualização do status do cavalo após uma venda

A trigger `trg_venda_atualiza_status_cavalo` foi criada para garantir a integridade dos dados durante o processo de venda de um cavalo. Ela é executada automaticamente após a inserção de um novo registro na tabela `venda`.

Inicialmente, a trigger realiza uma consulta na tabela `cavalo` para obter o status atual do animal relacionado à venda. Com base nesse status, são aplicadas as seguintes regras de negócio:

* Se o cavalo já estiver com o status **"Vendido"**, a operação é cancelada e é exibida uma mensagem de erro, impedindo que o mesmo cavalo seja vendido mais de uma vez.
* Se o cavalo estiver com o status **"Óbito"**, a venda também é cancelada, pois um animal falecido não pode ser comercializado.
* Caso o cavalo esteja apto para venda, a operação é concluída e seu status é atualizado automaticamente para **"Vendido"**.

A utilização dessa trigger é importante porque garante que essas regras sejam aplicadas diretamente pelo banco de dados, independentemente da aplicação utilizada para realizar as operações. Dessa forma, evita-se a inserção de dados inconsistentes, como a venda duplicada de um mesmo cavalo ou a venda de um animal com status de óbito, preservando a confiabilidade e a integridade das informações armazenadas.
