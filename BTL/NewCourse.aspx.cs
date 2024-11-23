using BTL.Enums;
using BTL.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class NewCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(bool)Session["Login"] && ((RoleUser)Session["Role"]) != RoleUser.Instructor)
            {
                Response.Redirect("Instructor");
                return;
            }
            if (!IsPostBack)
            {
                ddlCategories.DataSource = DBConnection.Instance.SelectDB("tblCategory");
                ddlCategories.DataTextField = "sName";
                ddlCategories.DataValueField = "PK_iID";
                ddlCategories.DataBind();
                Session["Lectures"] = new List<Lecture>();
                if (Request.QueryString["CourseID"] != null)
                {
                    BindingCourse();
                    BindingLecture();
                }
                else
                {
                    rptLecture.DataSource = Session["Lectures"];
                    rptLecture.DataBind();
                }
            }
        }

        void BindingCourse()
        {
            var data = DBConnection.Instance.SelectDB("vCourse", $"iIDCourse={Request.QueryString["CourseID"]}").Rows[0];
            if (data.Field<int>("iIDInstructor") != int.Parse(Session["ID"].ToString()))
            {
                Response.Redirect("Course");
                return;
            }
            ddlCategories.SelectedValue = data.Field<int>("iIDCategory").ToString();
            ddlCategories.DataBind();
            txtTitle.Text = data.Field<string>("sNameCourse");
            txtTitle.DataBind();
            txtDescription.Text = data.Field<string>("sDescription");
            txtDescription.DataBind();
            imgCourse.ImageUrl = "./Assets/" + data.Field<string>("sImage");
        }

        void BindingLecture()
        {
            var data = DBConnection.Instance.SelectDB("tblLecture", $"FK_iIDCourse={Request.QueryString["CourseID"]}");
            var lectures = new List<Lecture>();
            foreach (DataRow row in data.Rows)
            {
                lectures.Add(new Lecture
                {
                    Id = row.Field<int>("PK_iID"),
                    Name = row.Field<string>("sName"),
                    TimeStart = row.Field<DateTime>("dStart"),
                    TimeEnd = row.Field<DateTime>("dEnd"),
                    Status = row.Field<int>("iStatus"),
                    Url = row.Field<string>("sUrl")
                });

            }
            Session["Lectures"] = lectures;
            rptLecture.DataSource = Session["Lectures"];
            rptLecture.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int id = -1;
            if (Request.QueryString["CourseID"] == null)
            {
                CreateNewCourse();
                var courses = DBConnection.Instance.SelectDB("tblCourse").Rows;
                id = courses[courses.Count - 1].Field<int>("PK_iID");
            }
            else
            {
                id = int.Parse(Request.QueryString["CourseID"]);
                UpdateCourse();
            }
            var lectures = (Session["Lectures"] as List<Lecture>);
            foreach (var lecture in lectures)
            {
                if (lecture.Id == -1)
                {
                    if (!CreateNewLecture(lecture, id))
                    {
                        Master.Message.Text = "Thêm khóa học không thành công.";
                        Master.modalPlaceHolder.Controls.Add(new Literal
                        {
                            Text = @"
                        <script type='text/javascript'>
                            $(document).ready(function(){
                                $('#myModal').modal('show');
                            });
                        </script>"
                        });
                        Response.Redirect("Instructor");
                        return;
                    }
                }
                else
                {
                    if (!UpdateLecture(lecture))
                    {
                        Master.Message.Text = "Sửa khóa học không thành công.";
                        Master.modalPlaceHolder.Controls.Add(new Literal
                        {
                            Text = @"
                        <script type='text/javascript'>
                            $(document).ready(function(){
                                $('#myModal').modal('show');
                            });
                        </script>"
                        });
                        Response.Redirect("Instructor");
                        return;
                    }
                }

            }
            Master.Message.Text = Request.QueryString["CourseID"] == null ? "Thêm khóa học thành công." : "Sửa khóa học thành công";
            Master.modalPlaceHolder.Controls.Add(new Literal
            {
                Text = @"
                        <script type='text/javascript'>
                            $(document).ready(function(){
                                $('#myModal').modal('show');
                            });
                        </script>"
            });
            Response.Redirect("Instructor");

        }

        bool UpdateLecture(Lecture lecture)
        {
            return DBConnection.Instance.UpdateDB("tblLecture",
                DBConnection.Instance.BuildParameter("@PK_iID", SqlDbType.Int, 0, "PK_iID", lecture.Id),
                DBConnection.Instance.BuildParameter("@sName", SqlDbType.NVarChar, 100, "sName", lecture.Name),
                DBConnection.Instance.BuildParameter("@dStart", SqlDbType.DateTime, 0, "dStart", lecture.TimeStart),
                DBConnection.Instance.BuildParameter("@dEnd", SqlDbType.DateTime, 0, "dEnd", lecture.TimeEnd),
                DBConnection.Instance.BuildParameter("@iStatus", SqlDbType.Int, 0, "iStatus", lecture.Status),
                DBConnection.Instance.BuildParameter("@sUrl", SqlDbType.VarChar, 255, "sUrl", lecture.Url));
        }

        bool CreateNewLecture(Lecture lecture, int idCourse)
        {
            return DBConnection.Instance.InsertDB("tblLecture",
                DBConnection.Instance.BuildParameter("@sName", SqlDbType.NVarChar, 100, "sName", lecture.Name),
                DBConnection.Instance.BuildParameter("@FK_iIDCourse", SqlDbType.Int, 0, "FK_iIDCourse", idCourse),
                DBConnection.Instance.BuildParameter("@dStart", SqlDbType.DateTime, 0, "dStart", lecture.TimeStart),
                DBConnection.Instance.BuildParameter("@dEnd", SqlDbType.DateTime, 0, "dEnd", lecture.TimeEnd),
                DBConnection.Instance.BuildParameter("@iStatus", SqlDbType.Int, 0, "iStatus", lecture.Status),
                DBConnection.Instance.BuildParameter("@sUrl", SqlDbType.VarChar, 255, "sUrl", lecture.Url));
        }

        bool CreateNewCourse()
        {
            if (fuImage.HasFile)
            {
                string uploadPath = Server.MapPath("~/Assets/") + Path.GetFileName(fuImage.FileName);
                fuImage.SaveAs(uploadPath);
                imgCourse.ImageUrl = "./Assets/" + Path.GetFileName(fuImage.FileName);
            }
            return DBConnection.Instance.InsertDB("tblCourse",
                DBConnection.Instance.BuildParameter("@sName", SqlDbType.NVarChar, 100, "sName", txtTitle.Text),
                DBConnection.Instance.BuildParameter("@sDescription", SqlDbType.NVarChar, 255, "sDescription", txtDescription.Text),
                DBConnection.Instance.BuildParameter("@sImage", SqlDbType.VarChar, 100, "sImage", Path.GetFileName(imgCourse.ImageUrl)),
                DBConnection.Instance.BuildParameter("@FK_iIDInstructor", SqlDbType.Int, 0, "FK_iIDInstructor", Session["ID"]),
                DBConnection.Instance.BuildParameter("@FK_iIDCategory", SqlDbType.Int, 0, "FK_iIDCategory", ddlCategories.SelectedValue));
        }

        bool UpdateCourse()
        {
            return DBConnection.Instance.UpdateDB("tblCourse",
                DBConnection.Instance.BuildParameter("@PK_iID", SqlDbType.Int, 0, "PK_iID", Request.QueryString["CourseID"]),
                DBConnection.Instance.BuildParameter("@sName", SqlDbType.NVarChar, 100, "sName", txtTitle.Text),
                DBConnection.Instance.BuildParameter("@sDescription", SqlDbType.NVarChar, 255, "sDescription", txtDescription.Text),
                DBConnection.Instance.BuildParameter("@sImage", SqlDbType.VarChar, 100, "sImage", Path.GetFileName(imgCourse.ImageUrl)),
                DBConnection.Instance.BuildParameter("@FK_iIDInstructor", SqlDbType.Int, 0, "FK_iIDInstructor", Session["ID"]),
                DBConnection.Instance.BuildParameter("@FK_iIDCategory", SqlDbType.Int, 0, "FK_iIDCategory", ddlCategories.SelectedValue));
        }


        protected void btnSaveLecture_Click(object sender, EventArgs e)
        {
            int index = int.Parse(((Button)sender).CommandArgument);
            var item = rptLecture.Items[index];

            TextBox txtLecture = (TextBox)item.FindControl("txtLecture");
            TextBox txtDateTimeStart = (TextBox)item.FindControl("txtDateTimeStart");
            TextBox txtDateTimeEnd = (TextBox)item.FindControl("txtDateTimeEnd");
            DropDownList ddlStatus = (DropDownList)item.FindControl("ddlStatus");
            TextBox txtLinkLecture = (TextBox)item.FindControl("txtLinkLecture");

            Lecture lecture = (Session["Lectures"] as List<Lecture>)[index];
            lecture.Name = txtLecture.Text;
            if (DateTime.TryParse(txtDateTimeEnd.Text, out DateTime endDate))
            {
                lecture.TimeEnd = endDate;
            }
            if (DateTime.TryParse(txtDateTimeStart.Text, out DateTime startDate))
            {
                lecture.TimeStart = startDate;
            }
            lecture.Status = int.Parse(ddlStatus.SelectedValue);
            lecture.Url = txtLinkLecture.Text;
            (Session["Lectures"] as List<Lecture>)[index] = lecture;
            rptLecture.DataSource = Session["Lectures"];
            rptLecture.DataBind();
        }

        protected void btnDeleteLecture_Click(object sender, EventArgs e)
        {
            int index = int.Parse(((Button)sender).CommandArgument);
            var lecture = (Session["Lectures"] as List<Lecture>).ElementAt(index);
            if (lecture.Id != -1)
            {
                DBConnection.Instance.DeleteDB("tblLecture",
                DBConnection.Instance.BuildParameter("@PK_iID", SqlDbType.Int, 0, "PK_iID", lecture.Id));
            }
            (Session["Lectures"] as List<Lecture>).RemoveAt(index);
            rptLecture.DataSource = Session["Lectures"];
            rptLecture.DataBind();
        }

        protected void btnAddLecture_Click(object sender, EventArgs e)
        {
            (Session["Lectures"] as List<Lecture>).Add(new Lecture());
            rptLecture.DataSource = Session["Lectures"];
            rptLecture.DataBind();
        }

        protected void rptLecture_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var lecture = (Lecture)e.Item.DataItem;

                DropDownList ddlStatus = (DropDownList)e.Item.FindControl("ddlStatus");

                if (ddlStatus != null && lecture != null)
                {
                    ddlStatus.SelectedValue = lecture.Status.ToString();
                }
            }
        }

        protected void btnSaveImage_Click(object sender, EventArgs e)
        {
            if (fuImage.HasFile)
            {
                string uploadPath = Server.MapPath("~/Assets/") + Path.GetFileName(fuImage.FileName);
                fuImage.SaveAs(uploadPath);
                imgCourse.ImageUrl = "./Assets/" + Path.GetFileName(fuImage.FileName);
            }
        }
    }
}