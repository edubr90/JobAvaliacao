using System.Threading.Tasks;
using SimuladorCredito.Domain.Interfaces.Handlers;
using SimuladorCredito.Domain.Interfaces.Services;
using SimuladorCredito.Domain.Models;

namespace SimuladorCredito.Domain.Services
{
    public class SimulacaoService : ISimulacaoService
    {
        private readonly IProcessarCreditoDiretoHandler _processarCreditoDiretoHandler;
        private readonly IProcessarCreditoConsignadoHandler _processarCreditoConsignadoHandler;
        private readonly IProcessarCreditoPessoaJuridicaHandler _processarCreditoPessoaJuridicaHandler;
        private readonly IProcessarCreditoPessoaFisicaHandler _processarCreditoPessoaFisicaHandler;
        private readonly IProcessarCreditoImobiliarioHandler _processarCreditoImobiliarioHandler;
        private readonly IProcessarOperacaoBaseHandler _processarOperacaoBaseHandler;
        
        public SimulacaoService(
            IProcessarCreditoDiretoHandler processarCreditoDiretoHandler,
            IProcessarCreditoConsignadoHandler processarCreditoConsignadoHandler,
            IProcessarCreditoPessoaJuridicaHandler processarCreditoPessoaJuridicaHandler,
            IProcessarCreditoPessoaFisicaHandler processarCreditoPessoaFisicaHandler,
            IProcessarCreditoImobiliarioHandler processarCreditoImobiliarioHandler,
            IProcessarOperacaoBaseHandler processarOperacaoBaseHandler
        )
        {
            _processarCreditoDiretoHandler = processarCreditoDiretoHandler;
            _processarCreditoConsignadoHandler = processarCreditoConsignadoHandler;
            _processarCreditoPessoaJuridicaHandler = processarCreditoPessoaJuridicaHandler;
            _processarCreditoPessoaFisicaHandler = processarCreditoPessoaFisicaHandler;
            _processarCreditoImobiliarioHandler = processarCreditoImobiliarioHandler;
            _processarOperacaoBaseHandler = processarOperacaoBaseHandler;
        }

        public async Task<ObterSimulacaoCreditoResponse> ObterSimulacao(ObterSimulacaoCreditoRequest request)
        {
            return await Task.Run(() => 
            {
                _processarCreditoDiretoHandler
                .DefinirProximo(_processarCreditoConsignadoHandler)
                .DefinirProximo(_processarCreditoPessoaJuridicaHandler)
                .DefinirProximo(_processarCreditoPessoaFisicaHandler)
                .DefinirProximo(_processarCreditoImobiliarioHandler)
                .DefinirProximo(_processarOperacaoBaseHandler);

                var chainRequest = new SimulacaoCreditoChain
                {
                    Request = request,
                    Result = new ObterSimulacaoCreditoResponse()
                };

                _processarCreditoDiretoHandler.Handle(chainRequest);

                return chainRequest.Result;
            });
            
        }
    }
}