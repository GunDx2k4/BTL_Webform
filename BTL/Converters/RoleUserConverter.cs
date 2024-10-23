using BTL.Enums;
using System.Collections.Generic;

namespace BTL.Converters
{
    public class RoleUserConverter : BaseConverter<RoleUser>
    {
        public RoleUserConverter(bool useQuotes) : base(useQuotes) { }
        public RoleUserConverter() : base(true) { }

        protected override List<KeyValuePair<RoleUser, string>> Mapping =>
            new List<KeyValuePair<RoleUser, string>>
            {
                new KeyValuePair<RoleUser, string>(RoleUser.Student, "student"),
                new KeyValuePair<RoleUser, string>(RoleUser.Teacher, "teacher"),
                new KeyValuePair<RoleUser, string>(RoleUser.Administrator, "admin")

            };
    }
}