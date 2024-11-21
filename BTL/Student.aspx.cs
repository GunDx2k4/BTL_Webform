using BTL.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Student : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(bool)Session["Login"])
            {
                Response.Redirect("~/");
                return;
            }
            lblStudentName.Text = Session["User"].ToString();
            lblStudentEmail.Text = Session["Email"].ToString();

            var tableCourses = DBConnection.Instance.SelectDB("tblStudentCourse", $"FK_iIDUser={Session["ID"]}");

            lblTotalCourses.Text = tableCourses.Rows.Count.ToString();
            List<int> idCourses = new List<int>();
            foreach (DataRow row in tableCourses.Rows)
            {
                idCourses.Add(row.Field<int>("FK_iIDCourse"));

            }
            if (idCourses.Count > 0)
            {
                var data = DBConnection.Instance.SelectDB("vCourse", $"iIDCourse IN ({string.Join(",", idCourses)})");
                BindingCourse(data);
            }

            BindingSchedule(idCourses);
        }

        void BindingCourse(DataTable data)
        {
            Dictionary<Category, List<Course>> pairs = new Dictionary<Category, List<Course>>();
            foreach (DataRow row in data.Rows)
            {
                var key = new Category
                {
                    Id = row.Field<int>("iIDCategory"),
                    Name = row.Field<string>("sNameCategory")
                };
                if (!pairs.ContainsKey(key))
                {
                    pairs[key] = new List<Course>();
                }
                var dt = pairs[key];
                var course = new Course
                {
                    Id = row.Field<int>("iIDCourse"),
                    Category = key.Name,
                    Name = row.Field<string>("sNameCourse"),
                    Description = row.Field<string>("sDescription"),
                    Img = row.Field<string>("sImage"),
                    Instructor = row.Field<string>("sNameInstructor")

                };
                dt.Add(course);

            }
            rptCategories.DataSource = pairs;
            rptCategories.DataBind();
        }

        void BindingSchedule(List<int> idCourses)
        {
            var data2 = DBConnection.Instance.SelectDB("vLecture", $"iIDCourse IN ({string.Join(",", idCourses)})");
            DateTime today = DateTime.Now;
            DateTime startOfWeek = today.AddDays(-(int)today.DayOfWeek + (int)DayOfWeek.Monday);
            List<DaySchedule> objects = new List<DaySchedule>();
            for (int i = 0; i < 7; i++)
            {
                DateTime currentDay = startOfWeek.AddDays(i);
                var dt = new DaySchedule
                {
                    Date = currentDay.ToString("dd/MM/yyyy"),
                    DayOfWeek = currentDay.ToString("dddd", System.Threading.Thread.CurrentThread.CurrentCulture),
                    Classes = new List<ClassDetail>()
                };
                foreach (DataRow row in data2.Rows)
                {
                    if (row.Field<DateTime>("dStart").ToString("dd/MM/yyyy") == currentDay.ToString("dd/MM/yyyy"))
                    {
                        dt.Classes.Add(new ClassDetail
                        {
                            StatTime = row.Field<DateTime>("dStart").ToString("HH:mm"),
                            EndTime = row.Field<DateTime>("dEnd").ToString("HH:mm"),
                            NameCourse = row.Field<string>("sNameCourse"),
                            Instructor = row.Field<string>("sNameInstructor"),
                            Lecture = row.Field<string>("sNameLecture"),
                            Status = GetStatusLabel(row.Field<int>("iStatus"))
                        });
                    }
                }
                objects.Add(dt);
            }

            rptSchedule.DataSource = objects;
            rptSchedule.DataBind();
        }

        protected string GetStatusLabel(int status)
        {
            switch (status)
            {
                case 0:
                    return "Học";
                case 1:
                    return "Kết thúc";
                case 2:
                    return "Hủy";
                default:
                    return "";
            }
        }

        protected void rptSchedule_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DaySchedule daySchedule = (DaySchedule)e.Item.DataItem;

                Repeater rptClassDetails = (Repeater)e.Item.FindControl("rptScheduleDetail");

                rptClassDetails.DataSource = daySchedule.Classes;
                rptClassDetails.DataBind();
            }
        }

        protected void rptCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var categoryData = (KeyValuePair<Category, List<Course>>)e.Item.DataItem;

                Repeater rptClassDetails = (Repeater)e.Item.FindControl("rptCourses");

                rptClassDetails.DataSource = categoryData.Value;
                rptClassDetails.DataBind();
            }
        }
    }
}