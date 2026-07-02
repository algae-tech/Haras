-- Seleciona o banco de dados que será utilizado
USE mydb;

-- Altera o delimitador para $$, permitindo criar a trigger
-- sem que os ';' internos encerrem o comando.
DELIMITER $$

-- Cria uma trigger chamada trg_venda_atualiza_status_cavalo
-- Ela é executada automaticamente após a inserção de uma venda.
CREATE TRIGGER trg_venda_atualiza_status_cavalo
AFTER INSERT ON venda
FOR EACH ROW
BEGIN

    -- Variável que armazenará o status atual do cavalo.
    DECLARE v_status_atual VARCHAR(20);

    -- Consulta o status atual do cavalo relacionado à venda
    -- e armazena o resultado na variável v_status_atual.
    SELECT status
      INTO v_status_atual
      FROM cavalo
     WHERE id_cavalo = NEW.cavalo_id_cavalo;

    -- Verifica se o cavalo já foi vendido anteriormente.
    IF v_status_atual = 'Vendido' THEN

        -- Gera um erro e impede a operação.
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Operação inválida: este cavalo já foi vendido anteriormente.';

    -- Verifica se o cavalo está com status de óbito.
    ELSEIF v_status_atual = 'Óbito' THEN

        -- Gera um erro impedindo a venda.
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Operação inválida: não é possível vender um cavalo com status Óbito.';

    ELSE

        -- Caso o cavalo esteja disponível, atualiza seu status
        -- para "Vendido".
        UPDATE cavalo
           SET status = 'Vendido'
         WHERE id_cavalo = NEW.cavalo_id_cavalo;

    END IF;

END$$

-- Restaura o delimitador padrão (;)
DELIMITER ;