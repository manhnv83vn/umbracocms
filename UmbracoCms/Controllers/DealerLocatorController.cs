using System.Web.Mvc;
using Umbraco.Web.Models;
using Umbraco.Web.Mvc;

namespace UmbracoCms.Controllers
{
    public class DealerLocatorController : RenderMvcController
    {
        // GET: DealerLocator
        public override ActionResult Index(RenderModel model)
        {
            //var db = ApplicationContext.DatabaseContext.Database;
            //IEnumerable<int> jobs = db.Query<int>("SELECT 1 FROM ");
            //return base.Index(model);
            return CurrentTemplate(model);
        }
    }
}