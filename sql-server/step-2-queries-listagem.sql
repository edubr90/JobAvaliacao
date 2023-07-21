--
-- Listar todos os clientes do estado de SP que possuem mais de 60% das parcelas pagas:
--

SELECT
  cli.nome,
  cli.cpf,
  cli.uf,
  tp.nome AS tipo_financiamento,
  COUNT(parc.parcela_id) AS total,
  COUNT(parc.data_pagamento) AS pagto_efetuado,
  CAST(COUNT(parc.data_pagamento) AS numeric) / CAST(COUNT(parc.parcela_id) AS numeric) AS porcentual_pago
FROM Clientes cli
INNER JOIN Financiamentos fin
  ON cli.Cpf = fin.Cpf
INNER JOIN TiposFinanciamento tp
  ON fin.tipo_financiamento_id = tp.tipo_financiamento_id
INNER JOIN Parcelas parc
  ON fin.financiamento_id = parc.financiamento_id
WHERE cli.uf = 'SP'
GROUP BY cli.nome,
         cli.cpf,
         cli.uf,
         tp.nome
HAVING CAST(COUNT(parc.data_pagamento) AS numeric) / CAST(COUNT(parc.parcela_id) AS numeric) > 0.6;

--
-- Listar os primeiros quatro clientes que possuem alguma parcela com mais de cinco dia sem atraso (Data Vencimento maior que data atual E data pagamento nula).
--

SELECT TOP 4
  cli.*,
  tp.nome AS tipo_financiamento
FROM Clientes cli
INNER JOIN Financiamentos fin
  ON cli.Cpf = fin.Cpf
INNER JOIN TiposFinanciamento tp
  ON fin.tipo_financiamento_id = tp.tipo_financiamento_id
WHERE EXISTS (SELECT
  1
FROM Parcelas parc
WHERE fin.financiamento_id = parc.financiamento_id
AND parc.data_vencimento > GETDATE()
AND parc.data_pagamento IS NULL
AND DATEDIFF(DAY, GETDATE(), parc.data_vencimento) > 5)