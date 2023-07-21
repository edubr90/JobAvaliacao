using System.Collections.Generic;
using SimuladorCredito.Domain.Enum;

namespace SimuladorCredito.Domain.Models
{
    public class ObterSimulacaoCreditoResponse
    {
        public string StatusCredito { get; set; }
        public decimal ValorTotalComJuros { get; set; }
        public decimal ValorJuros { get; set; }
        public List<string> Erros { get; set; }
        public ObterSimulacaoCreditoResponse()
        {
            Erros = new List<string>();
        }
    }
}