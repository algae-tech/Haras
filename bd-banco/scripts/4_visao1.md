# Visão – Ocupação Atual das Baias

A visão `vw_baia_ocupacao_atual` foi criada para facilitar a consulta das baias que estão ocupadas no momento. Ela reúne, em uma única consulta, informações das tabelas `baia`, `baia_historico` e `cavalo`, eliminando a necessidade de realizar diversos comandos `JOIN` sempre que essa informação for necessária.

A visão apresenta o identificador da baia, seu número, tamanho, o identificador e o nome do cavalo que a ocupa, além da data de entrada do animal na baia. Para identificar apenas as ocupações atuais, são considerados somente os registros do histórico cuja `data_saida` é nula, indicando que o cavalo ainda permanece naquela baia.

A utilização dessa visão é importante para simplificar consultas frequentes realizadas no gerenciamento do haras, permitindo visualizar rapidamente quais baias estão ocupadas e por quais animais. Além de tornar as consultas mais simples e organizadas, a visão reduz a repetição de código SQL e facilita a manutenção do sistema, uma vez que qualquer alteração na lógica da consulta precisa ser feita apenas na definição da própria visão.
