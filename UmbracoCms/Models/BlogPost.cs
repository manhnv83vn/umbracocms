using Umbraco.Core.Models;
using Umbraco.Web.Models;

namespace UmbracoCms.ViewModels
{
    public class BlogPost : RenderModel
    {
        public BlogPost(IPublishedContent content) : base(content)
        { }

        public int Page { get; set; }
    }
}