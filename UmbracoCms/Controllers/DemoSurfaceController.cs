using System.Web.Mvc;
using Umbraco.Web.Mvc;

namespace UmbracoCms.Controllers
{
    public class DemoSurfaceController : SurfaceController
    {
        // GET: DemoSurface
        public ActionResult Index()
        {
            return Json("OK");
        }
    }
}