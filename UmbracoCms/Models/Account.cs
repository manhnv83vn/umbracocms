namespace UmbracoCms.ViewModels
{
    public class Account
    {
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public Account()
        {
        }

        public Account(string username, string email, string password)
        {
            UserName = username;
            Email = email;
            Password = password;
        }
    }
}