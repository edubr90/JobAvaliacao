using SimuladorCredito.Domain.Interfaces.Base;

namespace SimuladorCredito.Domain.Base
{
    public abstract class ChainBaseHandler<T> : IChainHandler<T>
    {
        private IChainHandler<T> _nextHandler;

        public IChainHandler<T> Proximo
        {
            get { return _nextHandler; }
            set { _nextHandler = value; }
        }

        public IChainHandler<T> DefinirProximo(IChainHandler<T> handler)
        {
            _nextHandler = handler;
            return handler;
        }

        public virtual T Handle(T request)
        {
            if (_nextHandler != null)
                return _nextHandler.Handle(request);
            else
                return request;
        }
    }
}