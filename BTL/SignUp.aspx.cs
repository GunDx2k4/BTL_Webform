using System;
using System.Data;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            var table = DBConnection.Instance.SelectDB("tblUser", $"sEmail = '{txtEmail.Text}'");
            if (table.Rows.Count > 0)
            {
                Master.Message.Text = "Email is registered";
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


            if (DBConnection.Instance.InsertDB("tblUser",
                DBConnection.Instance.BuildParameter("@sUsername", SqlDbType.NVarChar, 50, "sUsername", txtName.Text),
                DBConnection.Instance.BuildParameter("@sPassword", SqlDbType.NVarChar, 50, "sPassword", txtPass.Text),
                DBConnection.Instance.BuildParameter("@sEmail", SqlDbType.NVarChar, 100, "sEmail", txtEmail.Text),
                DBConnection.Instance.BuildParameter("@iRole", SqlDbType.Int, 0, "iRole", inputGroupRole.SelectedValue)))
            {
                Master.Message.Text = "Account is registered, return to Login in <span id='countdown' class=\"fw-semibold\">3</span>s";
                Master.modalPlaceHolder.Controls.Add(new Literal
                {
                    Text = @"
                    <script type='text/javascript'>
                        $(document).ready(function(){
                            $('#myModal').modal('show');
                            var seconds = 3;
                            var countdownInterval = setInterval(function () {
                                seconds--;
                                document.getElementById('countdown').innerText = seconds;
                                if (seconds <= 0) {
                                    clearInterval(countdownInterval);
                                    window.location.href = 'Login';
                                }
                            }, 1000);
                        });
                        
                    </script>"
                });
            }

        }
    }
}