using CustoFarmDalc;
using CustoFarmDalc.Models;
using Microsoft.EntityFrameworkCore;
using System;
using Xunit;

namespace CustoFarmTest
{
    public class UnitTest1
    {
        UserManagement _user;
        CustofarmContext dbContext;
        DbContextOptions<CustofarmContext> options;

        public UnitTest1()
        {
            options = new DbContextOptionsBuilder<CustofarmContext>().UseSqlServer("Server=tcp:custofarm.database.windows.net,1433;Initial Catalog=CustoFarm;Persist Security Info=False;User ID=custofarm;Password=93374262@gE;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;").Options;
            dbContext = new CustofarmContext(options);
            _user = new UserManagement(dbContext);
        }
        [Theory]
        [InlineData("zeeshanbge@gmail.com", "93374262", "Zeeshan")]
        [InlineData("zeeshanbge3@gmail.com", "93374262", "Zeeshan2")]

        public void LoginCheckShouldLogin(string email, string pass, string expct)
        {
            //Setup
            

            //Act
            var result = _user.CheckforLogin(email, pass);

            //accert
            Assert.NotNull(result);
        }
        [Fact]
        public void CheckforLogin_ShouldNotLogin()
        {
            var result = _user.CheckforLogin("Zeeshan", "933742");

            Assert.Null(result);
        }
    }
}
