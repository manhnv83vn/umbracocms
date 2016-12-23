using System.Web.Mvc;
using Umbraco.Core.Logging;
using Umbraco.Web.Models;
using Umbraco.Web.Mvc;

namespace UmbracoCms.Controllers
{
    // The base route controller allows the use of a surface controller and a rendermvc controller in one.
    // This allows us to create a controller that can be used for both route hyjacking and and form posting.
    public class BaseRouteController : SurfaceController, IRenderMvcController
    {
        // The default action to render the front-end view.
        public virtual ActionResult Index(RenderModel model)
        {
            // Just return the chosen template from the back office.
            return CurrentTemplate(model);
        }

        // Checks to make sure the physical view file exists on disk.
        protected bool EnsurePhysicalViewExists(string template)
        {
            var result = ViewEngines.Engines.FindView(ControllerContext, template, null);
            if (result.View == null)
            {
                LogHelper.Warn<BaseRouteController>("No physical template file was found for template " + template);
                return false;
            }
            return true;
        }

        // Returns an ActionResult based on the template name found in the route values and the given model.
        // If the template found in the route values doesn't physically exist, then an empty ContentResult will be returned.
        protected ActionResult CurrentTemplate(RenderModel model)
        {
            var template = ControllerContext.RouteData.Values["action"].ToString();
            if (!EnsurePhysicalViewExists(template))
            {
                return Content("");
            }
            return View(template, model);
        }
    }
}