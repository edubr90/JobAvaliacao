using System.Threading.Tasks;
using SimuladorCredito.Domain.Models;

namespace SimuladorCredito.Application.Interfaces
{
    public interface ISimulacaoApplication
    {
        Task<ObterSimulacaoCreditoResponse> ObterSimulacao(ObterSimulacaoCreditoRequest request);
    }
}