namespace CustoFarmBackend.Controllers
{
    public class LoginResult
    {
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public byte? EmailVerified { get; set; }
        public string Phone { get; set; }
        public string Country { get; set; }
        public bool Result { get; set; }
        public string Jwt { get; set; }


    }
}
