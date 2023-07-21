using Microsoft.Extensions.DependencyInjection;
using SimuladorCredito.Application;
using SimuladorCredito.Application.Interfaces;
using SimuladorCredito.Domain.Handlers;
using SimuladorCredito.Domain.Interfaces.Handlers;

namespace SimuladorCredito.CrossCutting.Configurations
{
    public static class HandlersDIConfig
    {
        public static void RegisterHandlers(this IServiceCollection services)
        {
            services.AddTransient<IProcessarCreditoDiretoHandler, ProcessarCreditoDiretoHandler>();
            services.AddTransient<IProcessarCreditoConsignadoHandler, ProcessarCreditoConsignadoHandler>();
            services.AddTransient<IProcessarCreditoPessoaJuridicaHandler, ProcessarCreditoPessoaJuridicaHandler>();
            services.AddTransient<IProcessarCreditoPessoaFisicaHandler, ProcessarCreditoPessoaFisicaHandler>();
            services.AddTransient<IProcessarCreditoImobiliarioHandler, ProcessarCreditoImobiliarioHandler>();
            services.AddTransient<IProcessarOperacaoBaseHandler, ProcessarOperacaoBaseHandler>();

        }
    }
}