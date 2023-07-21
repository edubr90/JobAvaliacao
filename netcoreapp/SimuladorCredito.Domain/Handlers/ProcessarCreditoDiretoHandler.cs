using System;
using SimuladorCredito.Domain.Base;
using SimuladorCredito.Domain.Enum;
using SimuladorCredito.Domain.Interfaces.Handlers;
using SimuladorCredito.Domain.Models;
using SimuladorCredito.Utils;

namespace SimuladorCredito.Domain.Handlers
{
    public class ProcessarCreditoDiretoHandler : ChainBaseHandler<SimulacaoCreditoChain>, IProcessarCreditoDiretoHandler
    {
        public ProcessarCreditoDiretoHandler()
        {
            
        }

        public override SimulacaoCreditoChain Handle(SimulacaoCreditoChain request)
        {
            if (request.Request.TipoCredito == TipoCredito.Direto.ToString())
            {
                request.TaxaJuros = 2;
            }
            
            return base.Handle(request);
        }
    }
}