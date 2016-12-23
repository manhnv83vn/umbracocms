using System.Web.Mvc;
using Umbraco.Web.Mvc;

namespace UmbracoCms.Controllers
{
    public class HelloWorldController : SurfaceController
    {
        // GET: /umbraco/surface/HelloWorld/Index/
        // GET: /umbraco/surface/HelloWorld/Index/1
        public ActionResult Index(int id)
        {
            return Content(string.Format("Hello World {0}", id));
        }
    }
}