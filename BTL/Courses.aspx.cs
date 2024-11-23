using BTL.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL
{
    public partial class Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["CategoryID"] == null)
            {
                LoadCourses();
            }
            else
            {
                LoadCourses(int.Parse(Request.QueryString["CategoryID"]));
            }
        }

        private void LoadCourses(int id = -1, string name = null)
        {
            DataTable data;
            if (id != -1)
            {
                data = DBConnection.Instance.SelectDB("vCourse", $"iIDCategory={id}" + (!string.IsNullOrEmpty(name) ? $" AND sNameCourse LIKE '%{name}%'" : string.Empty));
            }
            else
            {
                data = DBConnection.Instance.SelectDB("vCourse", (!string.IsNullOrEmpty(name) ? $" sNameCourse LIKE '%{name}%'" : string.Empty));
            }

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
                if (id == -1 && dt.Count >= 3) continue;
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


        protected void rptCategories_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var categoryData = (KeyValuePair<Category, List<Course>>)e.Item.DataItem;

                Repeater rptClassDetails = (Repeater)e.Item.FindControl("rptCourses");
                if (Request.QueryString["CategoryID"] != null || categoryData.Value.Count < 3)
                {
                    var linkCategory = (HyperLink)e.Item.FindControl("lnkCategory");
                    linkCategory.Visible = false;
                }

                rptClassDetails.DataSource = categoryData.Value;
                rptClassDetails.DataBind();
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (Request.QueryString["CategoryID"] == null)
            {
                LoadCourses(name: txtSearch.Text);
            }
            else
            {
                LoadCourses(int.Parse(Request.QueryString["CategoryID"]), txtSearch.Text);
            }
        }
    }
}