using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace BTL
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Session_Start(object sender, EventArgs e)
        {
            Session["Login"] = false;
            Session["Role"] = string.Empty;
            Session["Account"] = string.Empty;
            Session["Password"] = string.Empty;
        }

        void Session_End(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}