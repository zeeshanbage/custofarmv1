using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace CustoFarmDomain
{
    public static class Validations
    {
        public static bool isValidEmail(String emailAddress)
        {
            Regex regex = new Regex(@"^[\w0-9._%+-]+@[\w0-9.-]+\.[\w]{2,6}$");
            return regex.IsMatch(emailAddress);
        }
    }
}
