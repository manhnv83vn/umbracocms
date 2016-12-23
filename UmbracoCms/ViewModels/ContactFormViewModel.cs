using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using Umbraco.Core.Models;
using Umbraco.Web;
using Umbraco.Web.Models;

namespace UmbracoCms.ViewModels
{
    public class ContactFormViewModel : RenderModel
    {
        public ContactFormViewModel() : base(new UmbracoHelper(UmbracoContext.Current)
            .TypedContent(UmbracoContext.Current == null ? 0 : UmbracoContext.Current.PageId))
        { }

        public ContactFormViewModel(IPublishedContent content) : base(content, CultureInfo.CurrentCulture)
        {
        }

        [Required(ErrorMessage = "Please enter your email address")]
        [EmailAddress(ErrorMessage = "This is not a valid address")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Required(ErrorMessage = "Please enter your name")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Please enter a message")]
        [AllowHtml]
        public string Message { get; set; }

        public bool MessageSent { get; set; }
        public string ErrorMessage { get; set; }
    }
}