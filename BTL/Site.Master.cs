﻿using System;
using System.Web.UI;

namespace BTL
{
    public partial class SiteMaster : MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((bool)Session["Login"])
            {
                MultiViewNav.ActiveViewIndex = 1;
                lblUser.Text = Session["Account"].ToString();
            }
            else
            {
                MultiViewNav.ActiveViewIndex = 0;
                lblUser.Text = string.Empty;
            }
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["Login"] = false;
            Session.Abandon();
            Response.Redirect("~/");
        }

    }
}