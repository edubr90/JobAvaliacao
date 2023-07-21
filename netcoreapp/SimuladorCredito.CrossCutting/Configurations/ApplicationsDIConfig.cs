using Microsoft.Extensions.DependencyInjection;
using SimuladorCredito.Application;
using SimuladorCredito.Application.Interfaces;

namespace SimuladorCredito.CrossCutting.Configurations
{
    public static class ApplicationsDIConfig
    {
        public static void RegisterApplications(this IServiceCollection services)
        {
            
            services.AddTransient<ISimulacaoApplication, SimulacaoApplication>();
        }
    }
}