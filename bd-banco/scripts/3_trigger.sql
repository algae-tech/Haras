-- =====================================================================
-- Projeto: Sistema de Gestão de Haras
-- Artefato 4: Definição de gatilho (trigger)
-- =====================================================================
-- Ver 3_trigger.md para a explicação da regra de negócio.
-- =====================================================================

USE haras;

DELIMITER $$

CREATE TRIGGER trg_venda_atualiza_status_cavalo
AFTER INSERT ON venda
FOR EACH ROW
BEGIN
    DECLARE v_status_atual VARCHAR(20);

    -- Operação de SELECT sobre a tabela cavalo: verifica o status
    -- atual do animal antes de efetivar a atualização.
    SELECT status
      INTO v_status_atual
      FROM cavalo
     WHERE id_cavalo = NEW.cavalo_id_cavalo;

    IF v_status_atual = 'Vendido' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Operação inválida: este cavalo já foi vendido anteriormente.';
    ELSEIF v_status_atual = 'Óbito' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Operação inválida: não é possível vender um cavalo com status Óbito.';
    ELSE
        UPDATE cavalo
           SET status = 'Vendido'
         WHERE id_cavalo = NEW.cavalo_id_cavalo;
    END IF;
END$$

DELIMITER ;
