# README #

Este documento descreve a organização dos arquivos de resolução dos exercícios do teste de conhecimento acerca da Api .Net Core, Banco de dados (Sql Server) e o tema Conceitual.

### API .NET Core

No diretório /netcoreapp, temos uma api rest criada no netCore 3.1 para o cálculo dos valores relativos a liberação de crédito.
Por padrão, ao executar a aplicação o swagger é disponibilizado no endereço http://localhost:5000/swagger/index.html

Ao acessar o swagger, temos a possibilidade de testar a feature na controller de Simulação, no endpoint ObterSimulacao, conforme curl abaixo:

curl -X POST "http://localhost:5000/ObterSimulacao" -H  "accept: */*" -H  "Content-Type: application/json" -d "{\"valorCredito\":160000,\"tipoCredito\":\"PessoaFisica\",\"quantidadeParcelas\":24,\"dataPrimeiroVencimento\":\"2023-08-25\"}"

Sobre os parâmetros de entrada

valorCredito(decimal): deverá compreender entre 1 e 1000000,00;

tipoCredito(string): os tipos de crédito disponíveis para entrada são Direto, Consignado, PessoaJuridica, PessoaFisica ou Imobiliario;

quantidadeParcelas(int): deverá compreender entre 5 e 72;

dataPrimeiroVencimento(string): deverá compreender o intervalo mínimo de 15 dias e máximo de 40 dias.



### Oracle ou SQL Server ###

Para verificação dessa etapa, temos os seguintes arquivos no diretório /sql-server:

step-1-scripts-criacao-database.sql : Script com o schema de criação e carga dos dados nas tabelas.
step-2-queries-listagem.sql : Script com a resolução dos exercícios de listagem.

### Conceitual ###

Dentro da arquitetura distribuida de sistemas, podemos descrever o conceito de microsserviços como sendo um separador de responsabilidades. Basicamente, um microsserviço se trata de um módulo desacoplado contendo responsabilidades bem definidas, que em conjunto a outros módulos(serviços) trabalham para alcançar um objetivo comum ao domínio do negócio.

Entre seus benefícios estão o desacoplamento de funcionalidades, independência de tecnologias e alta capacidade de escalabilidade.

Dentro do diretório /conceitual, é possível visualizar uma representação ilustrativa do conceito de microsserviços.

### Obrigado ###