using CustoFarmDalc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;
namespace Custofarm.Tests
{
    public class Usertest
    {
        [Fact]
        public void ShouldRegister()
        {
            var user = new UserManagement();
            var userlogin = user.CheckforLogin("zeeshanbge@gmail.com", "93374262");
            Assert.NotNull(userlogin);
            //Assert.Equal("zeeshan", userlogin.UserFirstName);
        }
    }
}
