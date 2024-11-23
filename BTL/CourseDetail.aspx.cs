using BTL.Enums;
using System;
using System.Data;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class CourseDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["CourseID"] == null)
            {
                Response.Redirect("Courses");
                return;
            }
            BindingCourse();
        }

        void BindingCourse()
        {
            var data = DBConnection.Instance.SelectDB("vCourse", $"iIDCourse={Request.QueryString["CourseID"]}").Rows[0];
            lblCategory.Text = data.Field<string>("sNameCategory");
            lblCourse.Text = data.Field<string>("sNameCourse");
            lblInstructor.Text = data.Field<string>("sNameInstructor");
            lblDescription.Text = data.Field<string>("sDescription");

            imgCourse.ImageUrl = "./Assets/" + data.Field<string>("sImage");

            var lecture = DBConnection.Instance.SelectDB("tblLecture", $"FK_iIDCourse={Request.QueryString["CourseID"]}");
            lblCoutLectures.Text = $"{lecture.Rows.Count}";

            rptLectures.DataSource = lecture;
            rptLectures.DataBind();
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!(bool)Session["Login"])
            {
                Response.Redirect("Login");
                return;
            }
            if ((RoleUser)Session["Role"] != RoleUser.Student)
            {

                Master.Message.Text = "Bạn không có quyền đăng ký.";
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

            var tableCourses = DBConnection.Instance.SelectDB("tblStudentCourse", $"FK_iIDUser={Session["ID"]}");
            foreach (DataRow row in tableCourses.Rows)
            {
                if (row.Field<int>("FK_iIDCourse") == int.Parse(Request.QueryString["CourseID"]))
                {
                    Master.Message.Text = "Đã đăng ký khóa học này.";
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
            }

            if (DBConnection.Instance.InsertDB("tblStudentCourse",
                DBConnection.Instance.BuildParameter("@FK_iIDUser", SqlDbType.Int, 0, "FK_iIDUser", Session["ID"]),
                DBConnection.Instance.BuildParameter("@FK_iIDCourse", SqlDbType.Int, 0, "FK_iIDCourse", Request.QueryString["CourseID"])
                ))
            {
                Master.Message.Text = "Đăng ký thành công.";
                Master.modalPlaceHolder.Controls.Add(new Literal
                {
                    Text = @"
                        <script type='text/javascript'>
                            $(document).ready(function(){
                                $('#myModal').modal('show');
                            });
                        </script>"
                });
                Master.Message.Text = "Đăng ký thành công, quay lại trang lịch học sau <span id='countdown' class=\"fw-semibold\">3</span>s";
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
                                    window.location.href = 'Student';
                                }
                            }, 1000);
                        });
                        
                    </script>"
                });
            }
            else
            {
                Master.Message.Text = "Đăng ký thất bại.";
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