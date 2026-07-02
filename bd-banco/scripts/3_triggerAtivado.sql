-- =====================================================================
-- Projeto: Sistema de Gestão de Haras
-- Artefato 4: Ativação do trigger trg_venda_atualiza_status_cavalo
-- =====================================================================
-- Este script demonstra o funcionamento do trigger, mostrando o estado
-- do cavalo ANTES e DEPOIS de uma nova venda ser inserida.
--
-- Ele seleciona dinamicamente um cavalo com status 'Ativo' já existente
-- no seu banco (não depende de IDs fixos), então funciona com os dados
-- que você já populou em 2_popular.sql.
-- =====================================================================

USE mydb;

-- 0) Guarda em variáveis de sessão o ID de um cavalo Ativo, de um
--    cliente e de um funcionário quaisquer já cadastrados
SET @id_cavalo_teste      := (SELECT id_cavalo FROM cavalo WHERE status = 'Ativo' LIMIT 1);
SET @id_cliente_teste     := (SELECT id_cliente FROM cliente LIMIT 1);
SET @id_funcionario_teste := (SELECT id_funcionario FROM funcionario LIMIT 1);

-- 1) ANTES: consulta o status atual do cavalo escolhido
SELECT id_cavalo, nome, status
  FROM cavalo
 WHERE id_cavalo = @id_cavalo_teste;
-- Resultado esperado: status = 'Ativo'

-- 2) Insere uma nova venda para esse cavalo, o que dispara o trigger
INSERT INTO venda (data_venda, valor, cliente_id_cliente, cavalo_id_cavalo, funcionario_id_funcionario)
VALUES (NOW(), 45000.00, @id_cliente_teste, @id_cavalo_teste, @id_funcionario_teste);

-- 3) DEPOIS: consulta novamente o status do mesmo cavalo
SELECT id_cavalo, nome, status
  FROM cavalo
 WHERE id_cavalo = @id_cavalo_teste;
-- Resultado esperado: status = 'Vendido' (alterado automaticamente pelo trigger)

-- 4) Teste de bloqueio: tentar vender o MESMO cavalo novamente deve falhar
-- com o erro lançado pelo trigger (execute a linha abaixo para testar):
--INSERT INTO venda (
--    data_venda,
--    valor,
--    cliente_id_cliente,
--    cavalo_id_cavalo,
--    funcionario_id_funcionario
--)
--VALUES (
--    NOW(),
--    50000.00,
--    @id_cliente_teste,
--    @id_cavalo_teste,
--    @id_funcionario_teste
--);
-- Erro esperado: "Operação inválida: este cavalo já foi vendido anteriormente."
