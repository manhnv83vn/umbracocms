using Umbraco.Core.Models;
using Umbraco.Web;
using Umbraco.Web.Models;

namespace UmbracoCms.ViewModels
{
    public class BaseModel : RenderModel
    {
        // Parameterless constructor to handle postbacks, will call the main constructor.
        public BaseModel() : this(UmbracoContext.Current.PublishedContentRequest.PublishedContent) { }

        // Main constructor.
        public BaseModel(IPublishedContent content) : base(content) { }

        // Custome data to dispay in View
        public string MyVariable { get; set; }
    }
}