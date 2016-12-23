using System.Linq;
using System.Web.Mvc;
using Umbraco.Core.Logging;
using UmbracoCms.ViewModels;

namespace UmbracoCms.Controllers
{
    public class CategoryApiController : BaseUmbracoApiController
    {
        // GET:  /umbraco/api/CategoryApi/GetCategories
        public JsonResult GetCategories()
        {
            LogHelper.Info<CategoryApiController>("From the CategoryApiController.cs.");
            var db = ApplicationContext.DatabaseContext.Database;
            var categories = db.Query<umbCategory>("SELECT [category_id],[category_parent_id],[category_name],[description],[picture] FROM umbCategories");
            if (categories.Any())
            {
                return new JsonResult() { Data = categories };
            }
            return new JsonResult() { Data = new umbCategory() };
        }

        // GET:  /umbraco/api/CategoryApi/GetProducts?category_id=3
        public JsonResult GetProducts(int category_id)
        {
            LogInfo("category_id", category_id);
            var db = ApplicationContext.DatabaseContext.Database;
            var products = db.Query<umbProduct>(string.Format("SELECT [product_id],[category_id],[published],[rating_cache],[rating_count],[name],[pricing],[short_description],[long_description],[icon],[created_at],[updated_at] FROM [dbo].[umbProducts] WHERE [category_id] = {0}", category_id));
            if (products.Any())
            {
                return new JsonResult() { Data = products };
            }
            return new JsonResult() { Data = new umbProduct() };
        }
    }
}