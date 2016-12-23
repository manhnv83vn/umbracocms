using System.Web.Mvc;
using Umbraco.Web.Models;
using Umbraco.Web.Mvc;

namespace UmbracoCms.Controllers
{
    public class CategoryController : RenderMvcController
    {
        // GET: Category
        public override ActionResult Index(RenderModel model)
        {
            //return base.Index(model);
            return CurrentTemplate(model);
        }
    }
}