using System;
using System.Collections.Generic;
using System.Linq;
using SimuladorCredito.Domain.Base;
using SimuladorCredito.Domain.Enum;
using SimuladorCredito.Domain.Interfaces.Handlers;
using SimuladorCredito.Domain.Models;

namespace SimuladorCredito.Domain.Handlers
{
    public class ProcessarOperacaoBaseHandler : ChainBaseHandler<SimulacaoCreditoChain>, IProcessarOperacaoBaseHandler
    {
        public override SimulacaoCreditoChain Handle(SimulacaoCreditoChain request)
        {
            ObterCredito(request);
            return base.Handle(request);
        }

        public virtual ProcessarOperacaoBaseHandler ValidarValorCredito(SimulacaoCreditoChain request)
        {
            bool isValid = request.Request.ValorCredito >= 1 && request.Request.ValorCredito <= 1000000.0m;
            request.Validate(isValid);

            if (!isValid)
                request.Result.Erros.Add("Valor da operação inválido! O valor deve estar entre 1 e 1000000,00.");

            return this;
        }

        public virtual ProcessarOperacaoBaseHandler ValidarTipoCredito(SimulacaoCreditoChain request)
        {
            var tipos = new List<TipoCredito>
            {
                TipoCredito.Direto,
                TipoCredito.Consignado,
                TipoCredito.PessoaJuridica,
                TipoCredito.PessoaFisica,
                TipoCredito.Imobiliario
            };

            bool isValid = tipos.Where(_ => _.ToString() == request.Request.TipoCredito).Any();
            request.Validate(isValid);

            if (!isValid)
                request.Result.Erros.Add("Tipo do crédito selecionado é inválido!");

            return this;
        }



        public virtual ProcessarOperacaoBaseHandler ValidarQuantidadeParcelas(SimulacaoCreditoChain request)
        {
            bool isValid = request.Request.QuantidadeParcelas >= 5 && request.Request.QuantidadeParcelas <= 72;
            request.Validate(isValid);

            if (!isValid)
                request.Result.Erros.Add("Quantidade de parcelas invalida! As parcelas devem compreender entre 5 e 72 vezes.");

            return this;
        }

        public virtual ProcessarOperacaoBaseHandler ValidarDataPrimeiroVencimento(SimulacaoCreditoChain request)
        {
            DateTime now = DateTime.Today;
            DateTime minVencimento = now.AddDays(15);
            DateTime maxVencimento = now.AddDays(40);

            bool isValid = request.Request.DataPrimeiroVencimento >= minVencimento && request.Request.DataPrimeiroVencimento <= maxVencimento;
            request.Validate(isValid);

            if (!isValid)
                request.Result.Erros.Add("Data do primeiro vencimento é inválida! A data devera estar entre 15 e 40 dias.");

            return this;
        }

        public virtual decimal CalcularValorJuros(SimulacaoCreditoChain request)
        {
            return request.Request.ValorCredito * (request.TaxaJuros / 100);
        }

        public virtual decimal CalcularValorCreditoComJuros(SimulacaoCreditoChain request)
        {
            return request.Request.ValorCredito + CalcularValorJuros(request);
        }

        public virtual ProcessarOperacaoBaseHandler ObterCredito(SimulacaoCreditoChain request)
        {
            ValidarValorCredito(request)
            .ValidarTipoCredito(request)
            .ValidarQuantidadeParcelas(request)
            .ValidarDataPrimeiroVencimento(request);

            request.Result.StatusCredito = (request.IsValid ? StatusCredito.Aprovado : StatusCredito.Recusado).ToString();

            if (request.IsValid && !request.Result.Erros.Any())
            {
                request.Result.ValorJuros = CalcularValorJuros(request);
                request.Result.ValorTotalComJuros = CalcularValorCreditoComJuros(request);
            }

            return this;
        }
    }
}