using System;
using SimuladorCredito.Domain.Base;
using SimuladorCredito.Domain.Enum;
using SimuladorCredito.Domain.Interfaces.Handlers;
using SimuladorCredito.Domain.Models;
using SimuladorCredito.Utils;

namespace SimuladorCredito.Domain.Handlers
{
    public class ProcessarCreditoConsignadoHandler : ChainBaseHandler<SimulacaoCreditoChain>, IProcessarCreditoConsignadoHandler
    {
        public ProcessarCreditoConsignadoHandler()
        {
            
        }

        public override SimulacaoCreditoChain Handle(SimulacaoCreditoChain request)
        {
            if (request.Request.TipoCredito == TipoCredito.Consignado.ToString())
            {
                request.TaxaJuros = 1;
            }
            
            return base.Handle(request);
        }
    }
}