using BTL.Enums;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!(bool)Session["Login"] && ((RoleUser)Session["Role"]) != RoleUser.Administrator)
            {
                Response.Redirect("~/");
                return;
            }
            lblName.Text = Session["User"].ToString();
            lblEmail.Text = Session["Email"].ToString();

            var tableCourses = DBConnection.Instance.SelectDB("tblCourse");
            var tableStudents = DBConnection.Instance.SelectDB("tblUser", "iRole=0");
            var tableInstructors = DBConnection.Instance.SelectDB("tblUser", "iRole=1");

            lblTotalCourses.Text = tableCourses.Rows.Count.ToString();
            lblTotalInstructors.Text = tableInstructors.Rows.Count.ToString();
            lblTotalStudents.Text = tableStudents.Rows.Count.ToString();

            rptInstructors.DataSource = DBConnection.Instance.SelectDB("vInstructor");
            rptInstructors.DataBind();

            rptStudents.DataSource = DBConnection.Instance.SelectDB("vStudent");
            rptStudents.DataBind();

            rptCourses.DataSource = DBConnection.Instance.SelectDB("vCountCourse");
            rptCourses.DataBind();

            rptCategories.DataSource = DBConnection.Instance.SelectDB("vCategory");
            rptCategories.DataBind();
        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            if (DBConnection.Instance.InsertDB("tblCategory",
                DBConnection.Instance.BuildParameter("@sName", SqlDbType.NVarChar, 100, "sName", txtTitle.Text)))
            {
                Master.Message.Text = "Thêm chủ đề thành công thành công.";
                Master.modalPlaceHolder.Controls.Add(new Literal
                {
                    Text = @"
                        <script type='text/javascript'>
                            $(document).ready(function(){
                                $('#myModal').modal('show');
                            });
                        </script>"
                });
            }
        }
    }
}