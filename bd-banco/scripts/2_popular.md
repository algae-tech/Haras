# População do Banco de Dados

A população do banco de dados consistiu na inserção de dados fictícios em todas as tabelas do sistema, com o objetivo de simular o funcionamento de um haras em condições próximas às reais. Foram cadastrados registros de raças, pessoas, clientes, funcionários, cargos, baias, cavalos, histórico de ocupação das baias e vendas.

A geração dos dados buscou contemplar diferentes situações de uso do sistema, incluindo cavalos próprios e externos, animais ativos, vendidos, em tratamento e em óbito, além de diferentes relações de parentesco entre os cavalos por meio das chaves estrangeiras de pai e mãe.

Também foram criados registros de histórico de ocupação das baias, permitindo identificar tanto ocupações atuais quanto ocupações encerradas, possibilitando a utilização da visão (view) criada para consulta da ocupação atual das baias.

Os dados de vendas foram inseridos de forma consistente com as regras de negócio do sistema, permitindo validar o funcionamento do gatilho (trigger) responsável por impedir a venda de cavalos já vendidos ou com status de óbito, além de atualizar automaticamente o status do cavalo para "Vendido" quando uma venda válida é realizada.

A população do banco foi planejada para fornecer uma quantidade suficiente de registros para testes das consultas, visões, gatilhos e demais funcionalidades implementadas, permitindo verificar o correto funcionamento das restrições de integridade e dos relacionamentos entre as tabelas.
