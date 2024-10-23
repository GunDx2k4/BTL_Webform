using BTL.Converters;
using BTL.Enums;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTL.Models
{
    public class User
    {
        [JsonProperty("login")]
        public bool IsLogin { get; set; }

        [JsonProperty("username")]
        public string Username { get; set; }

        [JsonProperty("account")]
        public string Account { get; set; }

        [JsonProperty("password")]
        public string Password { get; set; }

        [JsonProperty("role"), JsonConverter(typeof(RoleUserConverter))]
        public RoleUser Role { get; set; }
    }
}