using System.Threading.Tasks;

namespace SimuladorCredito.Domain.Interfaces.Base
{
    public interface ICommand<Input, Output, CommandClass>
    {
        bool IsValid(Input aggregationRoot);
        Task<Output> Execute(Input aggregationRoot);
    }
}