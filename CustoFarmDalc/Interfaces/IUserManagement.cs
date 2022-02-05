using CustoFarmDalc.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace CustoFarmDalc
{
    public interface IUserManagement
    {
        User CheckforLogin(string Username, string Password);
        List<User> GetAllUsers();
        Task<bool> UserRegistration(User RegUser);
    }
}