using System.Threading.Tasks;
using SimuladorCredito.Domain.Models;

namespace SimuladorCredito.Domain.Interfaces.Services
{
    public interface ISimulacaoService
    {
        Task<ObterSimulacaoCreditoResponse> ObterSimulacao(ObterSimulacaoCreditoRequest request);
    }
}