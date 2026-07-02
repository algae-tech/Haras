USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`vw_baia_ocupacao_atual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vw_baia_ocupacao_atual` (`id_baia` INT, `numero` INT, `tamanho` INT, `id_cavalo` INT, `nome_cavalo` INT, `data_entrada` INT);

-- -----------------------------------------------------
-- View `mydb`.`vw_baia_ocupacao_atual`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`vw_baia_ocupacao_atual`;
USE `mydb`;
CREATE OR REPLACE VIEW vw_baia_ocupacao_atual AS
SELECT 
    b.id_baia,
    b.numero,
    b.tamanho,
    c.id_cavalo,
    c.nome AS nome_cavalo,
    h.data_entrada
FROM baia b
JOIN baia_historico h ON h.baia_id_baia = b.id_baia
JOIN cavalo c ON c.id_cavalo = h.cavalo_id_cavalo
WHERE h.data_saida IS NULL;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;