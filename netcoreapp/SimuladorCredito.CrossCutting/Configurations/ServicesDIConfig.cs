using Microsoft.Extensions.DependencyInjection;
using SimuladorCredito.Domain.Interfaces.Services;
using SimuladorCredito.Domain.Services;

namespace SimuladorCredito.CrossCutting.Configurations
{
    public static class ServicesDIConfig
    {
        public static void RegisterServices(this IServiceCollection services)
        {
            
            services.AddTransient<ISimulacaoService, SimulacaoService>();
        }
    }
}