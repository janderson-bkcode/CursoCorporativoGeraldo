using Domain.Interfaces;
using Domain.models;
using Infra;
using System.Threading.Tasks;

namespace Domain.services
{
    public class OrderService : IDrivingPort
    {
        private readonly Order _order;
        private readonly OrderRepository _orderRepository;

        public OrderService(Order order, OrderRepository orderRepository)
        {
            _order = order;
            _orderRepository = orderRepository;
        }

        public Task<OrderComand> handle(OrderComand command)
        {
            var response = _order.Create(command);

            return response;
        }
    }
}
