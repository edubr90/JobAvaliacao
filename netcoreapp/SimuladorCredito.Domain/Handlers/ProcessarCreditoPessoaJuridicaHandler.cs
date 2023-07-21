using System;
using SimuladorCredito.Domain.Base;
using SimuladorCredito.Domain.Enum;
using SimuladorCredito.Domain.Interfaces.Handlers;
using SimuladorCredito.Domain.Models;

namespace SimuladorCredito.Domain.Handlers
{
    public class ProcessarCreditoPessoaJuridicaHandler : ChainBaseHandler<SimulacaoCreditoChain>, IProcessarCreditoPessoaJuridicaHandler
    {
        public ProcessarCreditoPessoaJuridicaHandler()
        {
            
        }

        public override SimulacaoCreditoChain Handle(SimulacaoCreditoChain request)
        {
            if (request.Request.TipoCredito == TipoCredito.PessoaJuridica.ToString())
            {
                request.TaxaJuros = 5;
                Validate(request);
            }
            
            return base.Handle(request);
        }

        private void Validate(SimulacaoCreditoChain request)
        {
            bool isValid = request.Request.ValorCredito >= 15000;
            request.Validate(isValid);

            if (!isValid)
                request.Result.Erros.Add("O valor mínimo para contratação deste tipo de crédito é de 15000,00");
        }
    }
}