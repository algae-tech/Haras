-- Seleciona o banco de dados que será utilizado.
USE `mydb`;

-- -----------------------------------------------------
-- Tabela temporária (placeholder) para a view
-- -----------------------------------------------------
-- Esta tabela é criada apenas para evitar erros durante a
-- importação do script. Ela será removida antes da criação
-- da view definitiva.
CREATE TABLE IF NOT EXISTS `mydb`.`vw_baia_ocupacao_atual` (
    `id_baia` INT,
    `numero` INT,
    `tamanho` INT,
    `id_cavalo` INT,
    `nome_cavalo` INT,
    `data_entrada` INT
);

-- -----------------------------------------------------
-- View `vw_baia_ocupacao_atual`
-- -----------------------------------------------------

-- Remove a tabela temporária para permitir a criação da view.
DROP TABLE IF EXISTS `mydb`.`vw_baia_ocupacao_atual`;

-- Garante que o banco de dados correto está em uso.
USE `mydb`;

-- Cria (ou recria) a view que exibe a ocupação atual das baias.
CREATE OR REPLACE VIEW vw_baia_ocupacao_atual AS

-- Seleciona as informações da baia, do cavalo e da data
-- em que o animal entrou na baia.
SELECT 
    b.id_baia,
    b.numero,
    b.tamanho,
    c.id_cavalo,
    c.nome AS nome_cavalo,
    h.data_entrada

-- A consulta parte da tabela de baias.
FROM baia b

-- Relaciona cada baia ao seu histórico de ocupação.
JOIN baia_historico h
    ON h.baia_id_baia = b.id_baia

-- Relaciona o histórico ao cavalo que ocupa a baia.
JOIN cavalo c
    ON c.id_cavalo = h.cavalo_id_cavalo

-- Exibe apenas os registros cuja data de saída é nula,
-- indicando que o cavalo ainda está ocupando a baia.
WHERE h.data_saida IS NULL;