using FluentValidation;
using FluentValidation.Results;
using SimuladorCredito.Domain.Models;

namespace SimuladorCredito.Domain.Validators.Simulacao
{
    public class ObterSimulacaoCreditoValidator : AbstractValidator<ObterSimulacaoCreditoRequest>
    {
        public ObterSimulacaoCreditoValidator()
        {
        }
    }
}