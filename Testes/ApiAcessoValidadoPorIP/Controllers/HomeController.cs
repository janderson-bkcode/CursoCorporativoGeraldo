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
        [HttpGet("blocked")]
        public string blocked()
        {
            return "blocked access";
        }

    }
}
