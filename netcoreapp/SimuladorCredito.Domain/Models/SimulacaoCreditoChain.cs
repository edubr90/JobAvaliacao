using System.Linq;

namespace SimuladorCredito.Domain.Models
{
    public class SimulacaoCreditoChain
    {
        public bool IsValid { get; private set; }
        public decimal TaxaJuros { get; set; }
        public ObterSimulacaoCreditoRequest Request { get; set; }
        public ObterSimulacaoCreditoResponse Result { get; set; }

        public SimulacaoCreditoChain()
        {
            IsValid = true;
        }

        public SimulacaoCreditoChain Validate(bool validationResult)
        {
            IsValid = IsValid && validationResult;
            return this;
        }
    }
}