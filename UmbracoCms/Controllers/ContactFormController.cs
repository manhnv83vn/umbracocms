using System.Net.Mail;
using System.Web.Mvc;
using Umbraco.Core.Logging;
using Umbraco.Web.Mvc;
using UmbracoCms.ViewModels;

namespace UmbracoCms.Controllers
{
    public class ContactFormController : SurfaceController
    {
        private const string EmailTo = "somebody@your-website.com";
        private const string EmailFrom = "somebody@your-website.com";
        private const string Subject = "Message from your-website.com";
        private const string ErrorMessage = "We were unable to send your message. Have a cup of tea and try again later.";
        private const string ContactFormView = "_ContactForm";
        private const string MessageSentView = "_MessageSent";
        private const string EmailBody = "<html><body><p>From {0}</p>Email {1}<p></p>Message<br>{2}<p></p><p></p></body></html>";

        [HttpGet]
        public ActionResult ShowContactForm()
        {
            var model = new ContactFormViewModel(CurrentPage);
            return PartialView(ContactFormView, model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ShowContactForm(ContactFormViewModel model)
        {
            return PartialView(model.MessageSent ? MessageSentView : ContactFormView, model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PostContactForm(ContactFormViewModel model)
        {
            var currentUser = ApplicationContext.Services.UserService.GetByUsername("manhnv83@gmail.com");

            var template = ApplicationContext.Services.FileService.GetTemplate(CurrentPage.TemplateId);
            var path = template.VirtualPath;

            if (!ModelState.IsValid) return View(path, model);

            var mailMessage = new MailMessage
            {
                IsBodyHtml = true,
                Subject = Subject,
                Body = string.Format(EmailBody, model.Name, model.Email, model.Message),
                From = new MailAddress(EmailFrom, model.Name)
            };
            mailMessage.To.Add(new MailAddress(EmailTo));

            var client = new SmtpClient();

            try
            {
                client.Send(mailMessage);
                model.MessageSent = true;
            }
            catch (SmtpException smtpException)
            {
                LogHelper.Error<ContactFormController>(smtpException.Message, smtpException);
                model.ErrorMessage = ErrorMessage;
                model.MessageSent = false;
            }

            return View(path, model);
        }
    }
}