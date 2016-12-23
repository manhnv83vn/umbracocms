using System.Web.Mvc;
using System.Web.Profile;
using System.Web.Security;
using umbraco.cms.businesslogic.member;
using Umbraco.Web.Mvc;

namespace UmbracoCms.Controllers
{
    public class MemberManagementController : SurfaceController
    {
        public ActionResult Index()
        {
            string username = "HarveyNash";

            // Find member
            var member = Membership.FindUsersByEmail("manhnv83@gmail.com");

            // Find roles
            var roles = Roles.GetRolesForUser();

            // Add role
            Roles.AddUserToRole(Membership.GetUser().UserName, "Admin");

            // Check if a user belongs to a Role
            bool roleExit = Roles.IsUserInRole("Admin");

            // Approved user
            MembershipUser usr = Membership.GetUser(member); //username of member
            usr.IsApproved = false;//or true
            Membership.UpdateUser(usr);

            // Change password
            var m = Membership.GetUser();
            m.ChangePassword(m.GetPassword(), "1@3$5678");
            // Try
            // m.ChangePassword(m.ResetPassword(), "1@3$5678"); //
            //

            // Creating a new Member in Code
            var newMember = Membership.CreateUser("username", "password"); //there are overloads if you want to provide emails and such

            // Create a new Role
            Roles.CreateRole("new-role");

            // Creating a Profile
            var profile = ProfileBase.Create(username);

            // Finding member by username
            var m1 = Membership.FindUsersByName(username);

            // Finding Members by their Email
            var m2 = Membership.FindUsersByEmail("manhnv83@gmail.com");

            //
            // Get current logged in website member (from Members section)
            //

            var m3 = Member.GetCurrentMember();

            //
            // To get umbraco backend user(from Users section):
            //
            var m4 = umbraco.helper.GetCurrentUmbracoUser();

            Member m5 = Member.GetMemberFromEmail("manhnv83@gmail.com");
            var firstName = m5.getProperty("firstName");

            // Save property of Member by programming (Umbraco 7.x.x)
            m5.getProperty("firstName").Value = "New Name";
            m5.Save();//Save to database

            return View();
        }
    }
}