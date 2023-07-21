using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SimuladorCredito.CrossCutting.Configurations;

namespace SimuladorCredito.CrossCutting.IoC
{
    public static class DependencyResolver
    {
        public static void AddDependencyResolver(this IServiceCollection services, IConfiguration configuration)
        {
            services.RegisterServices();
            services.RegisterApplications();
            services.RegisterHandlers();
        }
    }
}