using System.Web.Mvc;
using Umbraco.Web.Models;
using Umbraco.Web.Mvc;
using UmbracoCms.ViewModels;

namespace UmbracoCms.Controllers
{
    public class ContactPageController : RenderMvcController
    {
        public override ActionResult Index(RenderModel model)
        {
            var viewModel = new ContactFormViewModel(model.Content);
            return CurrentTemplate(viewModel);
        }
    }
}