using BTL.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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