namespace SimuladorCredito.Domain.Interfaces.Base
{
    public interface IChainHandler<T>
    {
        IChainHandler<T> DefinirProximo(IChainHandler<T> handler);
        T Handle(T request);
    }
}