using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using CustoFarmDalc;
using CustoFarmDalc.Models;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using CustoFarmBackend.Dto;
using Microsoft.AspNetCore.Authorization;

namespace CustoFarmBackend.Controllers
{
    [ApiController]
    public class HomeController : ControllerBase
    {
        private readonly IUserManagement _user;
        public HomeController(CustofarmContext context)
        {
            _user = new UserManagement(context);
        }

        [HttpPost]
        [Route("api/home/login")]
        public ObjectResult Login([FromBody]UserLogin LoginReq)
        {
            var result =_user.CheckforLogin(LoginReq.username, LoginReq.password);
            if(result is default(User))
            {
                return new NotFoundObjectResult("User Not found");
            }
            var token = GenerateToken(result.Email, result.Firstname);
            var loginRes = new LoginResult
            {
                Username = result.Email,
                FirstName = result.Firstname,
                LastName = result.Lastname,
                Phone = result.Phone,
                Result = true,
                Jwt = token
            };
            return new ObjectResult(loginRes);
        }

        [HttpGet]
        [Route("api/home/allusers")]
        public ObjectResult AllUsers()
        {
            var res = _user.GetAllUsers();
            return new ObjectResult(res);
        }

        [HttpPost]
        [Route("api/home/register")]
        public async Task<ObjectResult> Register([FromBody] User newuser)
        {
            var result = await _user.UserRegistration(newuser);
            if (result)
            {
                return new CreatedResult("DataBase", true);
            }
            return new BadRequestObjectResult("Email Already Exist");
        }

        private  string GenerateToken(string username, string name)
        {

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Email, username),
                new Claim(ClaimTypes.Name, name),
                new Claim(JwtRegisteredClaimNames.Nbf, new DateTimeOffset(DateTime.Now).ToUnixTimeSeconds().ToString()),
                new Claim(JwtRegisteredClaimNames.Exp, new DateTimeOffset(DateTime.Now).AddHours(2).ToUnixTimeSeconds().ToString())
            };

            var authSignKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("Mysecretdocondeishthis"));

            var token = new JwtSecurityToken(
                expires: DateTime.Now.AddHours(3),
                claims: claims,
                signingCredentials: new SigningCredentials(authSignKey, SecurityAlgorithms.HmacSha256)
                );

            var output = new JwtSecurityTokenHandler().WriteToken(token);

            return output;
        }
    }
}
