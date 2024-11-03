using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace BTL
{
    /// <summary>
    /// Đây gọi là lớp mở rộng giúp bổ sung các chức năng 
    /// <br/>
    /// Lớp này chứa tất cả các phần mở rộng của tất cả các lớp và có thể là cả các kiểu dữ liệu
    /// <br/>
    /// Để tạo mới phương thức mở rộng cho các lớp khác thì thêm this [Tên lớp cần tạo hàm mở rộng] vào hàm mở rộng  
    /// <br/>
    /// VD : Đây là hàm mở rộng cho string
    /// <br/>
    /// public static void ExtensionString(this string str)
    /// <br/>
    ///     {
    /// <br/>
    ///         Console.Write($"Hello {str}");
    /// <br/>
    ///     }
    /// <br/>
    /// 
    /// </summary>
    public static class Extension
    {
        /// <summary>
        /// Hàm tạo <see cref="SqlCommand"/> là <see cref="CommandType.Text"/> dùng để Select
        /// </summary>
        /// <param name="table">Tên bảng cần tạo</param>
        /// <param name="query">(Nếu có) Mã SQL sau WHERE VD: "bDeleted=0 AND sHoTen LIKE %N%"</param>
        /// <returns></returns>
        public static SqlCommand BuildSelectCommand(this SqlConnection conn, string table, string query = "")
        {
            string sqlSelect = $"SELECT * FROM {table} " + (string.IsNullOrEmpty(query) ? "" : $"WHERE {query}");
            return new SqlCommand(sqlSelect, conn);
        }

        /// <summary>
        /// Hàm tạo <see cref="SqlCommand"/> là <see cref="CommandType.StoredProcedure"/> dùng để Insert
        /// </summary>
        /// <param name="nameProc">Tên hàm sử dụng trong để thêm dữ liệu</param>
        /// <param name="sqlParameters">Các thuộc tính cần thêm vào bảng (sử dụng <see cref="DBConnection.BuildParameter)"/> để tạo ra parameter cho chuẩn dạng dữ liệu)</param>
        /// <returns></returns>
        public static SqlCommand BuildInsertProc(this SqlConnection conn, string nameProc, params SqlParameter[] sqlParameters)
        {
            var cmd = new SqlCommand(nameProc, conn);
            cmd.CommandType = CommandType.StoredProcedure;

            foreach (var param in sqlParameters)
            {
                cmd.Parameters.Add(param);
            }

            return cmd;
        }

        /// <summary>
        /// Hàm tạo <see cref="SqlCommand"/> là <see cref="CommandType.Text"/> dùng để Insert
        /// </summary>
        /// <param name="table">Tên bảng</param>
        /// <param name="sqlParameters">Các thuộc tính cần thêm vào bảng (sử dụng <see cref="DBConnection.BuildParameter)"/> để tạo ra parameter cho chuẩn dạng dữ liệu)</param>
        /// <returns></returns>
        public static SqlCommand BuildInsertCommand(this SqlConnection conn, string table, params SqlParameter[] sqlParameters)
        {
            string sqlInsert = $"INSERT INTO {table}(";
            string value = " VALUES (";
            for (int i = 0; i < sqlParameters.Length; i++)
            {
                var param = sqlParameters[i];

                if (i == sqlParameters.Length - 1)
                {
                    sqlInsert += $"{param.SourceColumn})";
                    value += $"{param.ParameterName})";
                }
                else
                {
                    sqlInsert += $"{param.SourceColumn},";
                    value += $"{param.ParameterName},";
                }
            }
            sqlInsert += value;
            var cmd = new SqlCommand(sqlInsert, conn);
            foreach (var param in sqlParameters)
            {
                cmd.Parameters.AddWithValue(param.ParameterName, param.Value);
            }
            return cmd;
        }

        /// <summary>
        /// Hàm tạo <see cref="SqlCommand"/> là <see cref="CommandType.Text"/> dùng để Update
        /// </summary>
        /// <param name="table">Tên bảng</param>
        /// <param name="condition">Tên điều kiện cập nhật (sử dụng <see cref="DBConnection.BuildParameter)"/> để tạo ra parameter cho chuẩn dạng dữ liệu)</param>
        /// <param name="sqlParameters">Các thuộc tính cần cập nhật vào bảng (sử dụng <see cref="DBConnection.BuildParameter)"/> để tạo ra parameter cho chuẩn dạng dữ liệu)</param>
        /// <returns></returns>
        public static SqlCommand BuildUpdateCommand(this SqlConnection conn, string table, SqlParameter condition, params SqlParameter[] sqlParameters)
        {
            string sqlUpdate = $"UPDATE {table} SET ";

            for (int i = 0; i < sqlParameters.Length; i++)
            {
                var param = sqlParameters[i];

                sqlUpdate += $"{param.SourceColumn}={param.ParameterName}";

                if (i < sqlParameters.Length - 1) sqlUpdate += ", ";
            }

            sqlUpdate += $" WHERE {condition.SourceColumn}={condition.ParameterName}";

            var cmd = new SqlCommand(sqlUpdate, conn);
            foreach (var param in sqlParameters)
            {
                cmd.Parameters.AddWithValue(param.ParameterName, param.Value);
            }
            cmd.Parameters.AddWithValue(condition.ParameterName, condition.Value);
            return cmd;
        }
    }
}
