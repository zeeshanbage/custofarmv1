using CustoFarmDalc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CustoFarmBackend.Dto
{
    public class UserToken
    {
        public User user { get; set; }
        public string JwtToken { get; set; }
    }
}
