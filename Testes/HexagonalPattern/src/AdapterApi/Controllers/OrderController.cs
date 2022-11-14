using Domain.Interfaces;
using Domain.services;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace AdapterApi.Controllers
{
    public class OrderController : Controller
    {
        private readonly OrderService _orderService;

        public OrderController(OrderService orderService)
        {
            _orderService = orderService;
        }
        public IActionResult Index()
        {
            return View();
        }

        public  IActionResult createOrder()
        {
            var orderComand = new OrderComand();
            var orderResult = _orderService.handle(orderComand).Result;

            return View(orderResult);
            
        }
    }
}
