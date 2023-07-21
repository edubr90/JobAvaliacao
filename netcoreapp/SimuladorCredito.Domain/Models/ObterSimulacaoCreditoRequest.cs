using System;

namespace SimuladorCredito.Domain.Models
{
    public class ObterSimulacaoCreditoRequest
    {
        public decimal ValorCredito { get; set; }
        public string TipoCredito { get; set; }
        public int QuantidadeParcelas { get; set; }
        public DateTime DataPrimeiroVencimento { get; set; }
    }
}