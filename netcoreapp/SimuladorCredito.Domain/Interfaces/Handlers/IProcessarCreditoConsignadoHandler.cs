using SimuladorCredito.Domain.Interfaces.Base;
using SimuladorCredito.Domain.Models;

namespace SimuladorCredito.Domain.Interfaces.Handlers
{
    public interface IProcessarCreditoConsignadoHandler : IChainHandler<SimulacaoCreditoChain>
    {
        
    }
}