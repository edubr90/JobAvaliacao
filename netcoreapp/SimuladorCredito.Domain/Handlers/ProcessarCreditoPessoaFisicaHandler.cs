using SimuladorCredito.Domain.Base;
using SimuladorCredito.Domain.Enum;
using SimuladorCredito.Domain.Interfaces.Handlers;
using SimuladorCredito.Domain.Models;

namespace SimuladorCredito.Domain.Handlers
{
    public class ProcessarCreditoPessoaFisicaHandler : ChainBaseHandler<SimulacaoCreditoChain>, IProcessarCreditoPessoaFisicaHandler
    {
        public ProcessarCreditoPessoaFisicaHandler()
        {
            
        }

        public override SimulacaoCreditoChain Handle(SimulacaoCreditoChain request)
        {
            if (request.Request.TipoCredito == TipoCredito.PessoaFisica.ToString())
            {
                request.TaxaJuros = 3;
            }
            
            return base.Handle(request);
        }
    }
}