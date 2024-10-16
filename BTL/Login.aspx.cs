using System;
using System.Collections.Generic;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;
using System.Xml.Linq;

namespace BTL
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Session["Login"] = true;
            Session["Role"] = "student";
            Session["Account"] = txtEmail.Text;
            Session["Password"] = txtPass.Text;
            //Response.Redirect("Dashboard.aspx");

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Master.lblMessage.Text = $"Register {txtEmailRegister.Text}";
        }
    }
}