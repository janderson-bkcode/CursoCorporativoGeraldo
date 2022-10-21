using ApiAcessoValidadoPorIP.Extensions;
using Microsoft.AspNetCore.Mvc;

namespace ApiAcessoValidadoPorIP.Controllers
{
    [ApiController]
    public class HomeController : ControllerBase
    {
        
        [HttpGet("Unblocked")]
        public string Unblocked()
        {
            return "Unblocked access";
        }
        [ServiceFilter(typeof(IpBlockActionFilter))]
        [HttpGet("blocked")]
        public string blocked()
        {
            return "blocked access";
        }

    }
}
