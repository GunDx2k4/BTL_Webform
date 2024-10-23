using System;

namespace BTL
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["Login"])
            {
            }
            else
            {
                Response.Redirect("~/");
            }
        }
    }
}