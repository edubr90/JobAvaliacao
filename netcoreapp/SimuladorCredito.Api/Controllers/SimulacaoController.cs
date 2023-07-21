using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SimuladorCredito.Application.Interfaces;
using SimuladorCredito.Domain.Models;

namespace SimuladorCredito.Api.Controllers
{
    public class SimulacaoController : ControllerBase
    {
        private readonly ISimulacaoApplication _simulacaoApp;
        public SimulacaoController(ISimulacaoApplication simulacaoApp)
        {
            _simulacaoApp = simulacaoApp;
        }

        /// <summary>
        ///     Método que executa a rotina de liberação de crédito
        ///     Os tipos disponíveis são: Direto, Consignado, PessoaJuridica, PessoaFisica ou Imobiliário
        /// </summary>  
        /// <remarks>
        /// <b>Exemplos:</b>
        /// 
        ///{
        /// "valorCredito": 5000,
        /// "tipoCredito": "Direto/Consignado/PessoaJuridica/PessoaFisica/Imobiliario",
        /// "quantidadeParcelas": 5,
        /// "dataPrimeiroVencimento": "2023-07-30"
        ///}
        /// }
        /// 
        /// </remarks>
        /// <param name="body">Json conforme exemplo acima</param>
        /// <returns></returns>
        [HttpPost("ObterSimulacao")]
        public async Task<IActionResult> ObterSimulacaoCredito([FromBody] ObterSimulacaoCreditoRequest request)
        {
            try
            {
                return Ok(await _simulacaoApp.ObterSimulacao(request));
            }
            catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}