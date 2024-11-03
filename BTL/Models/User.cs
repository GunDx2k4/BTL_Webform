using BTL.Enums;

namespace BTL.Models
{
    public class User
    {
        public bool IsLogin { get; set; }

        public string Username { get; set; }

        public string Account { get; set; }

        public string Password { get; set; }

        public RoleUser Role { get; set; }
    }
}