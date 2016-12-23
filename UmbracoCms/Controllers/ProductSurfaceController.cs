using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web.Mvc;
using UmbracoCms.ViewModels;

namespace UmbracoCms.Controllers
{
    public class ProductSurfaceController : BaseSurfaceController
    {
        public ActionResult Index()
        {
            int id = 0;
            var product = new umbProduct();
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                id = Convert.ToInt32(Request.QueryString["id"]);
            }

            LogInfo("product_id", id);

            if (id > 0)
            {
                var db = ApplicationContext.DatabaseContext.Database;
                var products = db.Query<umbProduct>(string.Format("SELECT [product_id],[category_id],[published],[rating_cache],[rating_count],[name],[pricing],[short_description],[long_description],[icon],[created_at],[updated_at] FROM [dbo].[umbProducts] WHERE [product_id] = {0}", id));

                if (products.Any())
                {
                    product = products.FirstOrDefault();
                }
            }

            return PartialView("umbProduct", product);
        }

        public ActionResult View(int id = 0)
        {
            var product = new umbProduct();
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                id = Convert.ToInt32(Request.QueryString["id"]);
            }

            LogInfo("product_id", id);

            if (id > 0)
            {
                var db = ApplicationContext.DatabaseContext.Database;
                var products = db.Query<umbProduct>(string.Format("SELECT [product_id],[category_id],[published],[rating_cache],[rating_count],[name],[pricing],[short_description],[long_description],[icon],[created_at],[updated_at] FROM [dbo].[umbProducts] WHERE [product_id] = {0}", id));

                if (products.Any())
                {
                    product = products.FirstOrDefault();
                }
            }

            return PartialView("umbProduct", product);
        }

        // GET:  /umbraco/surface/ProductSurface/GetProductById?id=1
        public JsonResult GetProductById(int id)
        {
            LogInfo("product_id", id);
            var db = ApplicationContext.DatabaseContext.Database;
            var products = db.Query<umbProduct>(string.Format("SELECT [product_id],[category_id],[published],[rating_cache],[rating_count],[name],[pricing],[short_description],[long_description],[icon],[created_at],[updated_at] FROM [dbo].[umbProducts] WHERE [product_id] = {0}", id));
            if (products.Any())
            {
                return Json(products.FirstOrDefault(), JsonRequestBehavior.AllowGet);
            }
            return Json(new umbProduct(), JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// DataAccessLayer use the ADO.NET
        /// </summary>
        /// <returns></returns>
        private List<umbProduct> GetProducts()
        {
            List<umbProduct> productList = new List<umbProduct>();

            Dictionary<int, umbProduct> dictProducts = new Dictionary<int, umbProduct>();

            string connStr = @"Data Source=.\SQLEXPRESS;Initial Catalog=NORTHWND;Integrated Security=True";

            string queryStr = "SELECT TOP 10 product_id, name, pricing FROM umbProducts;";

            using (SqlConnection sqlConn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand(queryStr, sqlConn);
                try
                {
                    sqlConn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Debug.WriteLine("\t{0}\t{1}\t{2}", reader[0], reader[1], reader[2]);
                        umbProduct newProduct = new umbProduct
                        {
                            product_id = (int)reader[0],
                            name = reader[1].ToString(),
                            pricing = (double)reader[2]
                        };
                        productList.Add(newProduct);
                    }

                    reader.Close();
                }
                catch (Exception ex)
                {
                    Debug.WriteLine(ex.Message);
                }
            }

            return productList;
        }
    }
}