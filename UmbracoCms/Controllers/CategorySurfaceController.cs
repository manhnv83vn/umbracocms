using System.Linq;
using System.Web.Mvc;
using Umbraco.Core.Logging;
using UmbracoCms.ViewModels;

namespace UmbracoCms.Controllers
{
    public class CategorySurfaceController : BaseSurfaceController
    {
        // GET:  /umbraco/surface/CategorySurface/GetCategories
        public JsonResult GetCategories()
        {
            LogHelper.Info<CategorySurfaceController>("From the CategorySurfaceController.cs.");
            var db = ApplicationContext.DatabaseContext.Database;
            var categories = db.Query<umbCategory>("SELECT [category_id],[category_parent_id],[category_name],[description],[picture] FROM umbCategories");
            if (categories.Any())
            {
                return Json(categories, JsonRequestBehavior.AllowGet);
            }
            return Json(new umbCategory(), JsonRequestBehavior.AllowGet);
        }

        // GET:  /umbraco/surface/CategorySurface/GetProducts?category_id=3
        public JsonResult GetProducts(int category_id)
        {
            LogInfo("category_id", category_id);
            var db = ApplicationContext.DatabaseContext.Database;
            var products = db.Query<umbProduct>(string.Format("SELECT [product_id],[category_id],[published],[rating_cache],[rating_count],[name],[pricing],[short_description],[long_description],[icon],[created_at],[updated_at] FROM [dbo].[umbProducts] WHERE [category_id] = {0}", category_id));
            if (products.Any())
            {
                return Json(products, JsonRequestBehavior.AllowGet);
            }
            return Json(new umbProduct(), JsonRequestBehavior.AllowGet);
        }
    }
}