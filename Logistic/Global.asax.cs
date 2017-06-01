using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Logistic
{
    public class Global : HttpApplication
    {
        readonly log4net.ILog logger = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
          // AreaRegistration.RegisterAllAreas();
           //FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            
            log4net.Config.XmlConfigurator.Configure(new FileInfo(Server.MapPath("~/Web.config")));
        }
        //protected void Application_Error(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        //Exception exception = Server.GetLastError();
        //        //logger.Error(System.DateTime.Now.ToString() + exception.StackTrace.ToString());
        //        //if (exception != null)
        //        //{
                    
        //        //}
        //        //Server.ClearError();

        //        //RouteData routeData = new RouteData();
        //        //routeData.Values.Add("controller", "Error");
        //        //routeData.Values.Add("action", "Index");
        //        //routeData.Values.Add("exception", exception);

        //        //if (exception.GetType() == typeof(HttpException))
        //        //{
        //        //    routeData.Values.Add("statusCode", ((HttpException)exception).GetHttpCode());
        //        //}
        //        //else
        //        //{
        //        //    routeData.Values.Add("statusCode", 500);
        //        //}

        //       // IController controller = new ErrorController();
        //      //  controller.Execute(new RequestContext(new HttpContextWrapper(Context), routeData));
        //        Response.End();
        //    }
        //    catch (Exception ex)
        //    {
        //        logger.Error(System.DateTime.Now.ToString() + ex.Message);
        //    }

        //}
    }
}