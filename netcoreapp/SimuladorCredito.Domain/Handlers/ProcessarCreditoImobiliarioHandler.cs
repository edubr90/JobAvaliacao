using SimuladorCredito.Domain.Base;
using SimuladorCredito.Domain.Enum;
using SimuladorCredito.Domain.Interfaces.Handlers;
using SimuladorCredito.Domain.Models;

namespace SimuladorCredito.Domain.Handlers
{
    public class ProcessarCreditoImobiliarioHandler : ChainBaseHandler<SimulacaoCreditoChain>, IProcessarCreditoImobiliarioHandler
    {
        public ProcessarCreditoImobiliarioHandler()
        {
            
        }

        public override SimulacaoCreditoChain Handle(SimulacaoCreditoChain request)
        {
            if (request.Request.TipoCredito == TipoCredito.Imobiliario.ToString())
            {
                request.TaxaJuros = 9;
            }
            
            return base.Handle(request);
        }
    }
}