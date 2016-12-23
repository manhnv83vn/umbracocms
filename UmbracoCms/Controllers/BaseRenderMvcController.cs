using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Core.Logging;
using Umbraco.Web.Mvc;

namespace UmbracoCms.Controllers
{
    public class BaseRenderMvcController : RenderMvcController
    {
        public void LogInfo(string key, object value)
        {
            var enableDebug = System.Configuration.ConfigurationManager.AppSettings["Umbraco.Web.Mvc.Render.DebugEnable"].ToString().ToLower() == "true";
            if (enableDebug)
            {
                string className = string.Concat(this.ControllerContext.RouteData.Values["controller"].ToString(), "Controller.cs");
                string actionName = this.ControllerContext.RouteData.Values["action"].ToString();
                string controllerName = this.ControllerContext.RouteData.Values["controller"].ToString();
                LogHelper.Info<BaseUmbracoApiController>(string.Format("From the controller: '{0}', action: '{1}', class: '{2}'.", controllerName, actionName, className));
                if (!string.IsNullOrWhiteSpace(key) && null != value) LogHelper.Info<BaseUmbracoApiController>(string.Format("{0}: '{1}'", key, value.ToString()));
            }
        }
    }
}