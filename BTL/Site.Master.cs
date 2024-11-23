using BTL.Enums;
using System;
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
                lblUser.Text = Session["User"].ToString();
                lblEmail.Text = Session["Email"].ToString();
                lblRole.Text = GetRoleLabel((int)Session["Role"]);
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

        string GetRoleLabel(int role)
        {
            switch (role)
            {
                case 0:
                    return "Sinh viên";
                case 1:
                    return "Giảng viên";
                case 2:
                    return "Quản trị viên";
                default:
                    return "";
            }
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            switch ((RoleUser)Session["Role"])
            {
                case RoleUser.Student:
                    Response.Redirect("Student");
                    break;
                case RoleUser.Instructor:
                    Response.Redirect("Instructor");
                    break;
                case RoleUser.Administrator:
                    Response.Redirect("Admin");
                    break;
            }
        }
    }
}