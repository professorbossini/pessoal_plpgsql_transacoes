SELECT * FROM tb_conta;
BEGIN;

UPDATE tb_conta SET saldo = 500;

SAVEPOINT saldos_em_500;

UPDATE tb_conta SET saldo = saldo - 100
WHERE nome = 'Fernanda';

UPDATE tb_conta SET saldo = saldo + 100
WHERE nome = 'Maria';

SAVEPOINT fernanda_para_maria;

UPDATE tb_conta SET saldo = saldo - 50
WHERE nome = 'maria';

UPDATE tb_conta SET saldo = saldo + 50
WHERE nome = 'Cristina';

ROLLBACK TO fernanda_para_maria;

COMMIT;
