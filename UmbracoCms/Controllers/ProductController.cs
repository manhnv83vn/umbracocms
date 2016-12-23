using System.Web.Mvc;
using Umbraco.Web.Models;

namespace UmbracoCms.Controllers
{
    public class ProductController : BaseRenderMvcController
    {
        // GET: Product
        public override ActionResult Index(RenderModel model)
        {
            return CurrentTemplate(model);
        }
    }
}