using System.Threading.Tasks;
using SimuladorCredito.Application.Interfaces;
using SimuladorCredito.Domain.Interfaces.Services;
using SimuladorCredito.Domain.Models;

namespace SimuladorCredito.Application
{
    public class SimulacaoApplication : ISimulacaoApplication
    {
        private readonly ISimulacaoService _simulacaoService;
        public SimulacaoApplication(ISimulacaoService simulacaoService)
        {
            _simulacaoService = simulacaoService;
        }

        public async Task<ObterSimulacaoCreditoResponse> ObterSimulacao(ObterSimulacaoCreditoRequest request)
        {
            return await _simulacaoService.ObterSimulacao(request);
        }
    }
}