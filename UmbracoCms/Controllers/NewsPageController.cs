using System.Web.Mvc;
using Umbraco.Web.Mvc;

namespace UmbracoCms.Controllers
{
    public class NewsPageController : RenderMvcController
    {
        // GET: NewsPage
        public ActionResult Index()
        {
            return View();
        }
    }
}