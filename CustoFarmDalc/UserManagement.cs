using CustoFarmDalc.Models;
using CustoFarmDomain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CustoFarmDalc
{
    public class UserManagement : IUserManagement
    {
        private readonly CustofarmContext _dbContext;


        public UserManagement(CustofarmContext dbcontext)
        {
            _dbContext = dbcontext;
        }
        public User CheckforLogin(String Username, String Password)
        {
            if (Validations.isValidEmail(Username))
            {
                try
                {
                    var user = _dbContext.Users.FirstOrDefault(u => u.Email == Username && u.Password == Password);
                    return user;

                }
                catch (Exception)
                {
                    // ignored
                }
            }

            return default(User);
        }

        public List<User> GetAllUsers()
        {
            return _dbContext.Users.ToList();
        }

     

        public async Task<bool> UserRegistration(User RegUser)
        {
            if (_dbContext.Users.Any(user => user.Email == RegUser.Email))
            {
                return false;
            }
            await _dbContext.Users.AddAsync((User)RegUser);
            await _dbContext.SaveChangesAsync();
            return true;
        }

    }
}
