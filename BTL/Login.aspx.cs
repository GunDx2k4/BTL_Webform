using BTL.Converters;
using BTL.Enums;
using BTL.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["Login"])
            {
                Response.Redirect("Dashboard");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var json = File.ReadAllText(Server.MapPath("~/Data/Account.json"));
            var users = JsonConvert.DeserializeObject<List<User>>(json);
            var u = users.Find(user => user.Account.Equals(txtEmail.Text));
            if (u == null)
            {
                Master.Message.Text = "Error pass or account";
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
            Session["Login"] = true;
            Session["Username"] = u.Username;
            Session["Role"] = JsonConvert.SerializeObject(u.Role, new RoleUserConverter(false));
            Session["Account"] = txtEmail.Text;
            Session["Password"] = txtPass.Text;
            Response.Redirect("Dashboard.aspx");


        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var json = File.ReadAllText(Server.MapPath("~/Data/Account.json"));
            var users = JsonConvert.DeserializeObject<List<User>>(json);

            if (users.Find(user => user.Account.Contains(txtEmailRegister.Text)) != null)
            {
                Master.Message.Text = "The email you have provided is already associated with an account.";
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
            Session["Login"] = true;
            Session["Username"] = txtNameRegister.Text;
            Session["Role"] = inputGroupRole.SelectedValue;
            Session["Account"] = txtEmailRegister.Text;
            Session["Password"] = txtPassRegister.Text;
            users.Add(new User() { Account = txtEmailRegister.Text, Password = txtPassRegister.Text, Role = (RoleUser)Enum.Parse(typeof(RoleUser), inputGroupRole.SelectedValue), Username = txtNameRegister.Text });
            File.WriteAllText(Server.MapPath("~/Data/Account.json"), JsonConvert.SerializeObject(users));
            Response.Redirect("Dashboard.aspx");
        }
    }
}