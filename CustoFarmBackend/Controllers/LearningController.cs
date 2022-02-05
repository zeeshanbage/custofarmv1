using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CustoFarmBackend.Controllers
{
    public class LearningController : Controller
    {
        [HttpGet]
        public IActionResult Index()
        {
            return new ObjectResult("Learning Controler Index");
        }
    }
}
