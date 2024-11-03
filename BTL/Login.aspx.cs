using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var table = DBConnection.Instance.SelectDB("tblUser", $"sEmail = '{txtEmail.Text}' AND sPassword = '{txtPass.Text}'");
            if (table.Rows.Count <= 0)
            {
                Master.Message.Text = "Don't have account";
                Master.modalPlaceHolder.Controls.Add(new Literal
                {
                    Text = @"
                    <script type='text/javascript'>
                        $(document).ready(function(){
                            $('#myModal').modal('show');
                        });
                    </script>"
                });
                return;
            }
            Session["Account"] = txtEmail.Text;
            Session["Login"] = true;
            Response.Redirect("Courses");
        }
    }
}