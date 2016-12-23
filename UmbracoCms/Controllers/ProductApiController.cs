using System.Web.Mvc;
using UmbracoCms.ViewModels;

namespace UmbracoCms.Controllers
{
    public class ProductApiController : BaseUmbracoApiController
    {
        // GET:  /umbraco/api/CategoryApi/GetCategories
        public JsonResult GetProduct(int product_id)
        {
            LogInfo("product_id", product_id);
            var db = ApplicationContext.DatabaseContext.Database;
            var products = db.Query<umbProduct>(string.Format("SELECT [product_id],[category_id],[published],[rating_cache],[rating_count],[name],[pricing],[short_description],[long_description],[icon],[created_at],[updated_at] FROM [dbo].[umbProducts] WHERE [product_id] = {0}", product_id));
            return new JsonResult()
            {
                Data = products
            };
        }
    }
}